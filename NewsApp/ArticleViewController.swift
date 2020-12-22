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
        
        articleTableView.dataSource = self
        articleTableView.delegate = self
        
       articleTableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCustomCell")
        
        
        newsManager.getNews {
            data in
            self.theArticles = data
            
            DispatchQueue.main.async {
                self.articleTableView.reloadData()
            }
        }

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return theArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = articleTableView.dequeueReusableCell(withIdentifier: "ArticleCustomCell", for: indexPath) as! ArticleCell
        
        let theNews = theArticles[indexPath.row]
        
        cell.titleArticle?.text = theNews.title
        cell.descArticle.text = theNews.description
        cell.imageArticle.load(urlString: theNews.urlToImage!)
       
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ToStory", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! NewsStoryViewController
        
        if let indexPath = articleTableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = theArticles[indexPath.row]
            
        }
    }
    
    func didUpdateNews(){
        
        
    }
    
    func didFailWithError(){
        
        
    }
    
}

extension UIImageView {
    func load(urlString: String){
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}

