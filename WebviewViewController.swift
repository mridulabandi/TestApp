//
//  WebviewViewController.swift
//  TestApplication
//
//  Created by mysmac_adm!n on 03/01/20.
//  Copyright © 2020 Mridula. All rights reserved.
//

import UIKit

class WebviewViewController: UIViewController {

    @IBOutlet weak var Webview: UIWebView!
    var object = ViewController()
    var token = ""
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.token =  object.token
        self.Webview.loadRequest(NSURLRequest(url: NSURL(string: "https://mckinleyrice.com?token=" + self.token)! as URL) as URLRequest)
    }
    
 
          

}
