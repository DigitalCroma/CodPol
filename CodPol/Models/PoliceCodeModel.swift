//
//  PoliceCodeModel.swift
//  CodPol
//
//  Created by Juan Carlos Samboní Ramírez on 24/02/17.
//  Copyright © 2017 DigitalCroma. All rights reserved.
//

import Foundation

struct PoliceCode {
    struct Book {
        var name: String
        var information: String
        var titles: [Title]
    }
    
    struct Title {
        var name: String
        var information: String
        var chapters: [Chapter]
    }
    
    struct Chapter {
        var name: String
        var information: String
        var articles: [Article]
    }
    
    struct Article {
        var text: String
    }
    
    var books: [Book]
}
