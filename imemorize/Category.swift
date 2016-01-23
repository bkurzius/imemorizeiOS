//
//  Category.swift
//  imemorize
//
//  Created by Brian Kurzius on 1/9/16.
//  Copyright © 2016 Brian Kurzius. All rights reserved.
//

import UIKit

class Category{
    // MARK: Properties
    
    var title: String
    var id: Int
    
    init( id: Int, title: String ){
        self.title = title
        self.id = id
    }
    
}
