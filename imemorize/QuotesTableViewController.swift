//
//  QuotesTableViewController.swift
//  imemorize
//
//  Created by Brian Kurzius on 1/18/16.
//  Copyright © 2016 Brian Kurzius. All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController{
    var quotesArray:NSMutableArray!
    var catNumber:Int! = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuotes()
    }
    
    func setCategoryNumber(num:Int){
        NSLog("setCategoryNumber\(num)")
        self.catNumber = num;
    }
    
    func loadQuotes(){
        let mm:ModelManager = ModelManager()
        quotesArray = mm.getQuotes(catNumber)
        NSLog("loadQuotes:\(quotesArray.count)")

    }
    
//    // MARK: - Table view data source
//    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
//
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotesArray.count
    }
//
//    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("quoteTableViewCell", forIndexPath: indexPath) as! QuoteTableViewCell
        
        let quote:Quote = quotesArray.objectAtIndex(indexPath.row) as! Quote
        cell.label.text = quote.text
        
        return cell
    }
    
    override func tableView(tableView:UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath){
        let quote:Quote = quotesArray.objectAtIndex(indexPath.row) as! Quote
        NSLog("cellForRowAtIndexPath:quote:\(quote.text)")
        showQuote(indexPath.row)
        
    }
    
    func showQuote(index:Int){
        NSLog("showQuote")
        let vc = storyboard?.instantiateViewControllerWithIdentifier("quoteViewController") as! QuoteViewController
        vc.setQuotesArray(quotesArray,index:index)
        self.navigationController!.pushViewController(vc, animated: true)
    }

    

}
