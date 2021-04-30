//
//  AnimeDetailViewController.swift
//  Anime
//
//  Created by Lee Mccarthy-Pirie on 26/04/2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class AnimeDetailViewController: UIViewController {
        
    
    var animeData : anime?

    @IBOutlet weak var titleFeild: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var scoreId: UITextField!
   
    @IBOutlet weak var descId: UITextView!
    
    @IBOutlet weak var ratingId: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleFeild.text = animeData?.title
        descId.text = animeData?.synopsis
        if let s =  animeData?.score {
            ratingId.text = "Score : \(s)"
        }
        let url = URL(string: animeData?.image_url ?? "")
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        self.image?.image = UIImage(data: data!)
        self.image?.contentMode = .scaleAspectFit
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
    

        // Do any additional setup after loading the view.
    }


}
