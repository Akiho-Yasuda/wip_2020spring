//
//  NeckViewController.swift
//  test01
//
//  Created by yasudaakiho on 2020/07/01.
//  Copyright © 2020 yasudaakiho. All rights reserved.
//

import UIKit

class NeckWebViewController: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var neckwebview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let url = URL(string: "https://fashionbox.tkj.jp/archives/1008175"){
             neckwebview.loadRequest(URLRequest(url: url))
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
