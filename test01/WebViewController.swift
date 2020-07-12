//
//  WebViewController.swift
//  test01
//
//  Created by yasudaakiho on 2020/06/30.
//  Copyright © 2020 yasudaakiho. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let url = URL(string: "https://www.santen.co.jp/ja/healthcare/eye/eyecare/stretch/"){
            webView.loadRequest(URLRequest(url: url))
        }
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
