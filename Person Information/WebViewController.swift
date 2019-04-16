//
//  WebViewController.swift
//  Person Information
//
//  Created by Akhilesh Bhatia on 12/02/2019.
//  Copyright © 2019 Akhilesh Bhatia. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    var webData : String!
    var webView : WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Web Data";
        
        let url = URL(string: webData)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
