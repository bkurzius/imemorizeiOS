//
//  ViewController.swift
//  imemorize
//
//  Created by Brian Kurzius on 1/9/16.
//  Copyright © 2016 Brian Kurzius. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectQuote(sender: UIButton) {
        // load the category selector
    }
    
    @IBAction func cancelToMainViewController(segue:UIStoryboardSegue) {
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!){
       let navController = (segue.destinationViewController as! CategoryTableViewController);
        navController.setCategoryNumber(0)
    }
    
}
