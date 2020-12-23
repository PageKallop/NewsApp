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
        
        
    
    
        imageArticle.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        imageArticle.image = UIImage(named: "Trash_Icon")
        
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    
    }
    
 
    
}



