//
//  AnimeTableViewCell.swift
//  Anime
//
//  Created by Lee Mccarthy-Pirie on 22/04/2021.
//

import UIKit

class AnimeTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet weak var disc: UILabel!
    @IBOutlet var scoreLabel : UILabel!
    @IBOutlet var imageLabel : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
            }
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let indentifer="AnimeTableViewCell"
    static func nib()-> UINib{
        return UINib(nibName: "AnimeTableViewCell", bundle: nil)
    }
    
    func comfigure(with model: anime){
        if (self.titleLabel.text != nil){
            self.titleLabel.text = (model.title)
            self.titleLabel.contentMode = .scaleAspectFit
        }

        if (self.disc?.text != nil){
            self.disc.text = (model.synopsis)
            self.disc.contentMode = .scaleAspectFit
        }
      
        /*if let money =  model.score {
            self.scoreLabel.text = "\(money)"
            self.scoreLabel.contentMode = .scaleAspectFit
        }*/
        let url = URL(string: model.image_url ?? "")
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        self.imageView?.image = UIImage(data: data!)
        self.imageView?.contentMode = .scaleAspectFit
        
    }
}
