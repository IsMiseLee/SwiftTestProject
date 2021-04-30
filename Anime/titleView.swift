//
//  titleView.swift
//  Anime
//
//  Created by Lee Mccarthy-Pirie on 28/04/2021.
//

import UIKit

class titleView: UIViewController {


    @IBOutlet weak var appWelcome: UILabel!
    @IBOutlet weak var aniTitle: UILabel!
    
    @IBOutlet weak var aniOfDay: UILabel!
    @IBOutlet weak var aniImage: UIImageView!
    var animeModel = [resultAnimeRandom]()
    
    @IBOutlet weak var mangaOfDay: UILabel!
    @IBOutlet weak var mangaTitle: UILabel!
    @IBOutlet weak var mangaImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      //  getResponse()
        getResponseAnime()
        getResponseManga()
    }
    func getResponseAnime(){
        self.animeModel.removeAll()
        let  url="https://api.jikan.moe/v3/anime/\(Int.random(in: 1..<100))"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data,response,error in
            guard let data=data,error==nil else{
                print("Error")
                return
            }
            var json:resultAnimeRandom?
            do{
                json = try JSONDecoder().decode(resultAnimeRandom.self, from: data)
            }catch{
                print("Error 2\(error)")
            }
            
            guard let result = json else{ return}
            self.aniTitle.text = result.title_english
            let url = URL(string: result.image_url ?? "")
            let imageData = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            self.aniImage?.image = UIImage(data: imageData!)
            self.aniImage?.contentMode = .scaleAspectFit
            
        }).resume()
    }
    func getResponseManga(){
        self.animeModel.removeAll()
        let  url="https://api.jikan.moe/v3/manga/\(Int.random(in: 1..<100))"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data,response,error in
            guard let data=data,error==nil else{
                print("Error")
                return
            }
            var json:resultMangaRandom?
            do{
                json = try JSONDecoder().decode(resultMangaRandom.self, from: data)
            }catch{
                print("Error 2\(error)")
            }
            
            guard let result = json else{ return}
            self.mangaTitle.text = result.title_english
            print(result.title_english)
            let url = URL(string: result.image_url ?? "")
            let imageData = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            self.mangaImage?.image = UIImage(data: imageData!)
            self.mangaImage?.contentMode = .scaleAspectFit
            
        }).resume()
    }

    @IBAction func navToSearch(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier:  "search") as! ViewController
        present(vc,animated: true)
    }
    

}



struct resultAnimeRandom :Decodable{
    let request_hash : String?
    let request_cached : Bool?
    let request_cache_expiry: Int?
    let mal_id:Int?
    let url:String?
    let image_url:String?
    let trailer_url:String?
    let title:String?
    let title_english:String?
    let title_japanese:String?
    let title_synonyms:[String]?
    let type:String?
    let source:String?
    let episodes:Int?
    let status:String?
    let aired : airedData
    let duration:String?
    let rating:String?
    let score : Float?
    let scored_by: Int?
    let rank: Int?
    let popularity:Int?
    let members:Int?
    let favorites:Int?
    let synopsis:String?
    let background:String?
    let premiered:String?
    let broadcast:String?
    let related :related?
    let producers:[relatedArrs]?
    let licensors:[relatedArrs]?
    let studios:[relatedArrs]?
    let genres:[relatedArrs]?
    let opeining:[String]?
    let ending:[String]?
}
struct airedData:Decodable{
    let from:String?
    let to:String?
    let prop : dateData?
    let string: String?
}

struct dateData :Decodable{
    let from:from
    let to:to
    
}
struct from:Decodable{
    let day : Int?
    let month : Int?
    let year : Int?
}
struct to:Decodable{
    let day : Int?
    let month : Int?
    let year : Int?
}

struct related:Decodable {
    let adaptation : [relatedArrs]?
    let prequel    : [relatedArrs]?
    let Sequel     : [relatedArrs]?
    let alt    : [relatedArrs]?
    let Other    : [relatedArrs]?
}

struct relatedArrs:Decodable{
    let mal_id : Int?
    let type:String?
    let name:String?
    let url:String?
}

struct resultMangaRandom :Decodable{
    let request_hash : String?
    let request_cached : Bool?
    let request_cache_expiry: Int?
    let mal_id:Int?
    let url:String?
    let image_url:String?
    let trailer_url:String?
    let title:String?
    let title_english:String?
    let title_japanese:String?
    let title_synonyms:[String]?
    let type:String?
    let volumes:Int?
    let chapters:Int?
    let pubishing:Bool?
    let published : airedData?
    let duration:String?
    let rating:String?
    let score : Float?
    let scored_by: Int?
    let rank: Int?
    let popularity:Int?
    let members:Int?
    let favorites:Int?
    let synopsis:String?
    let background:String?
    let related :related?
    let genres:[relatedArrs]?
    let authors:[relatedArrs]?
    let studios:[relatedArrs]?
    let serializations:[relatedArrs]?
}

