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
        
        
        //sets itself to weather manager delegate
        newsManager.delegate = self
        
        articleTableView.dataSource = self
        articleTableView.delegate = self
        
        
        //registers the article cell nib
       articleTableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCustomCell")
        // brings over the data from the selected cell
        newsManager.getNews {
            data in
            self.theArticles = data
            
            DispatchQueue.main.async {
                self.articleTableView.reloadData()
            }
        }
        
    }
   
  
    
    // table view delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return theArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //uses the custom cell xib
        let cell = articleTableView.dequeueReusableCell(withIdentifier: "ArticleCustomCell", for: indexPath) as! ArticleCell
        

        let theNews = theArticles[indexPath.row]
        //populates the UIlabels and UIImage
        cell.imageArticle.load(urlString: theNews.urlToImage!)
        cell.titleArticle?.text = theNews.title
        cell.descArticle.text = theNews.description
        
         
        return cell 
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //identifies the seugue to be used
        performSegue(withIdentifier: "ToStory", sender: self)
    }
    //creates segue to NewsStoryVC from selected cell 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! NewsStoryViewController
        
        if let indexPath = articleTableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = theArticles[indexPath.row]
            
        }
    }
    //protocall method
    func didUpdateNews(){
        
        
    }
    //protocall method
    func didFailWithError(){
        
        
    }
}


extension UIImageView  {

    //creates method to get image
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




