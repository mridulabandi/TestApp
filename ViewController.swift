//
//  ViewController.swift
//  TestApplication
//
//  Created by mysmac_adm!n on 03/01/20.
//  Copyright © 2020 Mridula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var IDtextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var WarningLabel: UILabel!
    
    var token = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.InitialSetup()
    }

    func InitialSetup()
    {
        self.WarningLabel.isHidden = true
    }
    @IBAction func LoginAction(_ sender: Any)
    {
        
        if self.IDtextField.text == " " || self.PasswordTextField.text == ""
        {
            self.WarningLabel.isHidden = false
            
        }
        else
        {
            self.WarningLabel.isHidden = false
            let url = URL(string: "https://reqres.in/Request" + self.IDtextField.text! + ":" + self.PasswordTextField.text!)!
                   var request = URLRequest(url: url)
                   request.httpMethod = "POST"
                   let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                       if let error = error {
                           print("error: \(error)")
                       }
                       else
                       {
                           if let response = response as? HTTPURLResponse {
                               print("statusCode: \(response.statusCode)")
                            
                            if response  != nil
                            {
                                self.token = response.value(forHTTPHeaderField: self.token)!
                                let storyboard = UIStoryboard(name: "WebviewViewController", bundle: nil)
                                let Class = storyboard.instantiateViewController(withIdentifier: "WebviewViewController") as! WebviewViewController
                                self.navigationController?.pushViewController(Class, animated: true)
                            }
                            
                           }
                           if let data = data, let dataString = String(data: data, encoding: .utf8) {
                               print("data: \(dataString)")
                           }
                       }
                   }
        }
        
       
    
    }
    
}

