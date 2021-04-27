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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

 
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
