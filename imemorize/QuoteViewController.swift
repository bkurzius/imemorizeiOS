//
//  QuoteViewController.swift
//  imemorize
//
//  Created by Brian Kurzius on 1/18/16.
//  Copyright © 2016 Brian Kurzius. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {
    
    var quotesArray:NSMutableArray!
    var index:Int = 0
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var currentQuoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false;
        loadWebview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setQuotesArray(array:NSMutableArray, index:Int){
        self.quotesArray = array
        self.index = index
    }
    
    func loadWebview(){
        NSLog("loadWebview:")
        let bundle = NSBundle.mainBundle()
        let url = bundle.URLForResource("index", withExtension: "html")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        // start the timer - better if we can have this happen when the webview fully loads
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "loadQuote", userInfo: nil, repeats: false)
    }

    
    func loadQuote(){
        let myQuote = quotesArray[index] as! Quote
        NSLog("QuoteViewController:quote: \(myQuote.text)")
        NSLog("QuoteViewController:quote: num: \(index+1) of \(quotesArray.count)")
        var introtext = myQuote.introtext
        if introtext=="NULL" {introtext=""}
        let quote = myQuote.text
        var author = myQuote.author
        if author=="NULL" {author=""}
        var reference = myQuote.reference
        if reference=="NULL" {reference=""}
        let language = myQuote.language
        let url = myQuote.url
        
        webView.stringByEvaluatingJavaScriptFromString("HideQuoteGame.buildQuoteScreen('\(introtext)','\(quote)','\(author)','\(reference)','\(language)','','\(url)');");
        
        currentQuoteLabel.text = "Quote \(index+1) of \(quotesArray.count)"
    }
    
    
    
    func callSwift(message:String){
            NSLog("callSwift:=")
    }
    
  @IBAction  func loadNextQuote(sender: UIBarButtonItem){
        index++
        if index<quotesArray.count-1{
            let myQuote = quotesArray[index] as! Quote
            NSLog("QuoteViewController:quote: \(myQuote.text)")
            NSLog("QuoteViewController:quote: num: \(index+1) of \(quotesArray.count)")
            loadQuote();
        }
    }
    
   @IBAction func loadPreviousQuote(sender: UIBarButtonItem){
        index--
        if index > -1{
            let myQuote = quotesArray[index] as! Quote
            NSLog("QuoteViewController:quote: \(myQuote.text)")
            NSLog("QuoteViewController:quote: num: \(index+1) of \(quotesArray.count)")
            loadQuote();
        }
    }
    
    @IBAction func hideWords(){
        webView.stringByEvaluatingJavaScriptFromString("HideQuoteGame.hideWords()")
    }
    
    @IBAction func showAllWords(){
        webView.stringByEvaluatingJavaScriptFromString("HideQuoteGame.showAllWords()")
    }
    

    @IBAction func back(sender: UIBarButtonItem) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
