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
    
    @IBOutlet weak var newsStoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsStoryLabel.sizeToFit()
        newsStoryLabel.numberOfLines = 0 
        
        newsManager.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        newsTitleLabel.text = selectedCategory!.title
        newsStoryLabel.text = selectedCategory!.content
    }
    
    
    func didUpdateNews(){
        
      
       
        
    }
    
    func didFailWithError(){
        
        
    }
    
}
