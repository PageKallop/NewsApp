//
//  NewsStoryViewController.swift
//  NewsApp
//
//  Created by Page Kallop on 12/21/20.
//

import Foundation
import UIKit

class NewsStoryViewController: UIViewController, NewsManagerDelegate {
    
    var newsManager = NewsManager()
    
    var theArticles = [Articles]()
    
    var selectedCategory : Articles? {
        
        didSet {
            
            didUpdateNews()
        }
    }

   
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    
    @IBOutlet weak var storyView: UITextView!
    
    
   
    @IBOutlet weak var imageArticle: UIImageView!
    
    @IBOutlet weak var authName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyView.isEditable = false
        
        newsManager.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        newsTitleLabel.text = selectedCategory!.title

        storyView.text = selectedCategory?.content
        
        authName.text = selectedCategory?.author
        
        imageArticle.load(urlString: (selectedCategory?.urlToImage)!)
      
        
    }
    
    
    func didUpdateNews(){
        
      
       
        
    }
    
    func didFailWithError(){
        
        
    }
    
}
