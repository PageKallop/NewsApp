//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Page Kallop on 12/21/20.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    var theArticles = Articles()
   

    @IBOutlet weak var imageArticle: UIImageView!
    
    
    @IBOutlet weak var titleArticle: UILabel!
    
    
    @IBOutlet weak var descArticle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        

        
        imageArticle.frame.size = CGSize(width: 225, height: 346)
       // creates placeholder image
        imageArticle.image = UIImage(named: "2ndblackSquare")

    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    
    }
    
 
    
}



