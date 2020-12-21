//
//  ViewController.swift
//  NewsApp
//
//  Created by Page Kallop on 12/21/20.
//

import Foundation
import UIKit

class ArticleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NewsManagerDelegate {

    
    var newsManager = NewsManager()
    
    var theArticles = [Articles]()
  
    @IBOutlet weak var articleTableView: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsManager.delegate = self 
        
       articleTableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCustomCell")
        print("load cell")
        
        articleTableView.dataSource = self
        articleTableView.delegate = self

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = articleTableView.dequeueReusableCell(withIdentifier: "ArticleCustomCell", for: indexPath) as! ArticleCell
        
        print("load cell")
        
        cell.titleArticle.text = "hi"
        cell.descArticle.text = "what a world"
       
        return cell 
    }
    
    func didUpdateNews(){
        
        
    }
    
    func didFailWithError(){
        
        
    }
    
    


}

