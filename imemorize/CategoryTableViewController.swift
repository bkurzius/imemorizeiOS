//
//  CategoryTableViewController.swift
//  imemorize
//
//  Created by Brian Kurzius on 1/9/16.
//  Copyright © 2016 Brian Kurzius. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController{
    
    // MARK: Properties
    
//    var categories = [Category]()
    var catArray:NSMutableArray!
    var catNumber:Int! = 1
    var netCatNumber:Int! = 0
    @IBOutlet var thisTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    func setCategoryNumber(num:Int){
        NSLog("setCategoryNumber\(num)")
        self.catNumber = num;
    }

    
    func loadCategories(){
        let mm:ModelManager = ModelManager()
        catArray = mm.getCategories(catNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryTableViewCell", forIndexPath: indexPath) as! CategoryTableViewCell
        
        let cat:Category = catArray.objectAtIndex(indexPath.row) as! Category
        cell.catLabel.text = cat.title
        
        return cell
    }
    
    @IBAction func newCat(sender: UIBarButtonItem) {
        // test adding a new categoryViewController
    }
    
    override func tableView(tableView:UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath){
        let cat:Category = catArray.objectAtIndex(indexPath.row) as! Category
        NSLog("cellForRowAtIndexPath:catNumber:\(cat.id)")
        // if no more categories then we can get quotes
        //see if there are categories
        let mm:ModelManager = ModelManager()
        let catArrayTest:NSMutableArray! = mm.getCategories(cat.id)
        if catArrayTest.count > 0{
            openNewCategory(cat.id)
        }else{
            openQuotesViewer(cat.id)
            NSLog("cellForRowAtIndexPath:numberofQuotes:\(catArrayTest.count)")
        }
        
    }
   
    // open category
    func openNewCategory(id:Int){
        NSLog("openNewCategory")
        let vc = storyboard?.instantiateViewControllerWithIdentifier("categoryTableViewController") as? CategoryTableViewController
            vc!.setCategoryNumber(id)
        self.navigationController!.pushViewController(vc!, animated: true)
    }
    
    func openQuotesViewer(id:Int){
        NSLog("openQuotesViewer")
        let vc = storyboard?.instantiateViewControllerWithIdentifier("quotesTableViewController") as? QuotesTableViewController
        vc!.setCategoryNumber(id)
        self.navigationController!.pushViewController(vc!, animated: true)
    }
}
