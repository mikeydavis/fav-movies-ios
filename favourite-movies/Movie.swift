//
//  Movie.swift
//  favourite-movies
//
//  Created by Mike Davis on 30/03/2018.
//  Copyright © 2018 Midax. All rights reserved.
//

import Foundation

class Movie {
    var id: String = ""
    var title: String = ""
    var year: String = ""
    var imageUrl: String = ""
    var plot: String = ""
    
    init(id: String, title: String, year: String, imageUrl: String){
    
    self.id = id
    self.title = title
    self.year = year
    self.imageUrl = imageUrl
    }
    
}
