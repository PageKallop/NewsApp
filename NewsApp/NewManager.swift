//
//  NewManager.swift
//  NewsApp
//
//  Created by Page Kallop on 12/21/20.
//

import Foundation

protocol NewsManagerDelegate {
    func didUpdateNews()
    func didFailWithError()
}

struct NewsManager {
    
    var delegate: NewsManagerDelegate?
    
    var theNews = [Articles]()
    
    
    mutating func getNews(comp : @escaping ([Articles]) ->()) {
        
        let newsURL = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&sortBy=latest&apiKey=")
      
        URLSession.shared.dataTask(with: newsURL!) { (data, responce, error) in
            if error != nil {
                print(error!)
                return
            }
            do {
                let results = try JSONDecoder().decode(NewsData.self, from: data!)
                comp(results.articles)
                print(results.articles)
            } catch {
                print("error")
            }
        } .resume()
        
    }
}
