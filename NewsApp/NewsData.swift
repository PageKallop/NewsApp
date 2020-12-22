//
//  NewsData.swift
//  NewsApp
//
//  Created by Page Kallop on 12/21/20.
//

import Foundation

 // creates a struct to decode and encode the data from the api call

struct NewsData: Codable {
    
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Articles]
}

//creates a stuct from all the items in the Article array 
struct Articles: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
