//
//  ViewController.swift
//  Anime
//
//  Created by Lee Mccarthy-Pirie on 22/04/2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextViewDelegate {

    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var nameField: UITextView!
    @IBOutlet weak var queryNameField: UITextField!
    var animeModel = [anime]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        table.register(AnimeTableViewCell.nib(), forCellReuseIdentifier: AnimeTableViewCell.indentifer)
        table.delegate=self
        table.dataSource=self
        nameField.delegate=self
        }

    
    func getResponse(search:String,type:String){
        self.animeModel.removeAll()
        let queryString = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let  baseUrl="https://api.jikan.moe/v3/search/\(type)?q="
        let url=baseUrl+queryString!
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data,response,error in
            guard let data=data,error==nil else{
                print("Error")
                return
            }
            var json:Results?
            do{
                json = try JSONDecoder().decode(Results.self, from: data)
            }catch{
                print("Error 2\(error)")
            }
            
            guard let result = json else{ return}
            let n = result.results.count
            print(n)
            let entries = result.results
            self.animeModel.append(contentsOf: entries)
            
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }).resume()
    }
    
    @IBAction func onClick(_ sender: Any) {
      
        getResponse(search: nameField.text!,type:"anime")
        
    }
    
    @IBAction func onClickManga(_ sender: Any) {
        getResponse(search: nameField.text!,type :"manga")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animeModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnimeTableViewCell.indentifer,for:indexPath) as! AnimeTableViewCell
        cell.comfigure(with: animeModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AnimeDetailViewController {
            
            destination.animeData = animeModel[(table.indexPathForSelectedRow?.row)!]
            table.deselectRow(at: table.indexPathForSelectedRow!, animated: true)
        }
    }

    }



extension ViewController :UITextFieldDelegate{
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

struct Results: Codable{
    let last_page:Int?
    let request_cache_expiry:Int?
    let request_cached:Bool?
    let request_hash:String?
    let results : [anime]
    
}

    struct anime: Codable{
        let mal_id: Int?
        let url:String?
        let image_url:String?
        let title:String?
        let airing:Bool?
        let synopsis:String?
        let type:String?
        let episodes:Int?
        let score:Double?
        let start_date:String?
        let end_date:String?
        let members:Int?
        let rated:String?
        
    }


