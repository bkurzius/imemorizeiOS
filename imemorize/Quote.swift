//
//  Quote.swift
//  imemorize
//
//  Created by Brian Kurzius on 1/18/16.
//  Copyright © 2016 Brian Kurzius. All rights reserved.
//

import UIKit

class Quote{
    // MARK: Properties
    var id: Int
    var introtext:String
    var text:String
    var author: String
    var reference:String
    var language:String = "English"
    var url:String
    
    
    init(id: Int, introtext: String, text: String, author:String, reference:String, language:String, url:String ){
        self.introtext = introtext
        self.text = text
        self.id = id
        self.author = author
        self.reference = reference
        if language.isEmpty{self.language = "English"} else { self.language = language }
        self.url = url
    }
    
}