//
//  ViewController.swift
//  web
//
//  Created by AsukaKadowaki on 2016/02/08.
//  Copyright © 2016年 AsukaKadowaki. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBAction func tapBtn() {
        if let url = NSURL(string: "http://mdpr.jp"){
            let vc = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
            vc.delegate = self
            presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        print("close")
    }

    @IBOutlet weak var myImageView: UIImageView!
    @IBAction func tapLoadImage() {
        let stringURL = "https://amazingslider.com/wp-content/uploads/2012/12/dandelion.jpg"
        if let url = NSURL(string: stringURL){
        if let data = NSData(contentsOfURL: url){
            myImageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func tapLoadText1() {
        if let url = NSURL(string:"http://www.ymori.com/itest/test.txt"){
        let urlSession = NSURLSession.sharedSession()
        let task = urlSession.dataTaskWithURL(url, completionHandler:{
            (data, response, error) in
                if let nsstr = NSString(data: data!, encoding: NSUTF8StringEncoding){
                let str = String(nsstr)
                print("文字列=[\(str)]")
                }
            })
            task.resume()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

