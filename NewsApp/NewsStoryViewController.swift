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
    
    //allows data to be passed over through tableview cell
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
        
        //makes the textview uneditable
        storyView.isEditable = false
        //sets itself to weather manager delegate
        newsManager.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //loads UI items with data
        newsTitleLabel.text = selectedCategory!.title

        storyView.text = selectedCategory?.content
        
        authName.text = selectedCategory?.author
        
        imageArticle.load(urlString: (selectedCategory?.urlToImage)!)
      
        
    }
    
    //protocall method
    func didUpdateNews(){
    
    }
    //protocall method
    func didFailWithError(){
        
        }
    
}


