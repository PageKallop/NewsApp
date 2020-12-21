//
//  NewsData.swift
//  NewsApp
//
//  Created by Page Kallop on 12/21/20.
//

import Foundation

struct NewsData: Codable {
    
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Articles]
}


struct Articles: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String? 
}
