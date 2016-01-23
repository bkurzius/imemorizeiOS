//
//  ModelManager.swift
//  imemorize
//
//  Created by Brian Kurzius on 1/9/16.
//  Copyright © 2016 Brian Kurzius. All rights reserved.
//

import Foundation

class ModelManager{
    
    // MARK: properties
    var database:FMDatabase
    static let sharedInstance = ModelManager()

    init(){
       database = FMDatabase(path: Util.getPath("imemorize.db"))
    }
    
    // This code is called at most once
    class func getInstance() -> ModelManager{
        return sharedInstance
    }
    
    
    func getMainCategories() -> NSMutableArray {
        database.open()
        let resultSet: FMResultSet! = database.executeQuery("select distinct quotecategories._id, quotecategories.catName from quotecategories, categoryrelations where quotecategories._id = categoryrelations.catID and categoryrelations.catParent = 0 order by quotecategories.sortOrder, quotecategories.catName asc;", withArgumentsInArray: nil)
        let catArray : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let title = resultSet.stringForColumn("catName")
                let id = resultSet.intForColumn("_id")
                let cat : Category = Category(id:Int(id),title:title)
                catArray.addObject(cat)
            }
        }
        database.close()
        return catArray
    }
    
    func getCategories(id:Int) -> NSMutableArray {
        database.open()
        let resultSet: FMResultSet! = database.executeQuery("select distinct quotecategories._id, quotecategories.catName from quotecategories, categoryrelations where quotecategories._id = categoryrelations.catID and categoryrelations.catParent = \(id) order by quotecategories.sortOrder, quotecategories.catName asc;", withArgumentsInArray: nil)
        let catArray : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let title = resultSet.stringForColumn("catName")
                let id = resultSet.intForColumn("_id")
                let cat : Category = Category(id:Int(id),title:title)
                catArray.addObject(cat)
            }
        }
        database.close()
        return catArray
    }
    
    
    func getQuotes(id:Int) -> NSMutableArray {
        database.open()
        let resultSet: FMResultSet! = database.executeQuery("SELECT quotes._id, quotes.text, quotes.introtext, quotes.author, quotes.reference, quotes.language, quotes.url FROM quotecategories, quotesets, quotes WHERE quotecategories._id = quotesets.catid and quotesets.quoteid = quotes._id and quotesets.catid = \(id) order by quotesets.quoteid asc", withArgumentsInArray: nil)
        let quoteArray : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                NSLog("resultSet:next")
                let ii = resultSet.stringForColumn("introtext")
                let q = resultSet.stringForColumn("text")
                let i = resultSet.intForColumn("_id")
                let r = resultSet.stringForColumn("reference")
                let a = resultSet.stringForColumn("author")
                 let l = resultSet.stringForColumn("language")
                let u = resultSet.stringForColumn("url")
                let quote : Quote = Quote(id:Int(i),introtext:ii,text:q,author:a,reference:r,language:l, url:u)
                quoteArray.addObject(quote)
            }
        }else{
            NSLog("resultSet:nil")
        }
        database.close()
        return quoteArray
    }


    
}


