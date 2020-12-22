//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Page Kallop on 12/21/20.
//

import UIKit

class ArticleCell: UITableViewCell {
   

    @IBOutlet weak var imageArticle: UIImageView!
    
    
    @IBOutlet weak var titleArticle: UILabel!
    
    
    @IBOutlet weak var descArticle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
}
