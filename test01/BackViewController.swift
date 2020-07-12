//
//  BackViewController.swift
//  test01
//
//  Created by yasudaakiho on 2020/07/07.
//  Copyright © 2020 yasudaakiho. All rights reserved.
//

import UIKit

class BackViewController: UIViewController {

    @IBOutlet weak var backwebview: UIWebView!
    override func viewDidLoad() {
         super.viewDidLoad()
           
               if let url = URL(string: "https://mi-mollet.com/articles/-/15906"){
                    backwebview.loadRequest(URLRequest(url: url))
        }
               
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
