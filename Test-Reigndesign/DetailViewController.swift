//
//  DetailViewController.swift
//  Test-Reigndesign
//
//  Created by Jose David Bustos H on 07-07-18.
//  Copyright © 2018 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    
    var nameString:String!
    var dobString:String!
    var UrlString:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.updateUI()
        
    //    let url = URL(string: "http://www.nytimes.com")
    //    myWebView.loadRequest(URLRequest(url: url!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
       // self.nameLabel.text = nameString
       // self.dobLabel.text = dobString
       // let data = NSData(contentsOf: (imgURL)!)
       // self.imageView.image = UIImage(data: data as! Data)
        
        let url = URL(string: UrlString)
        myWebView.loadRequest(URLRequest(url: url!))
    }
}
