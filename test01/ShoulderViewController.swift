//
//  ShoulderViewController.swift
//  test01
//
//  Created by yasudaakiho on 2020/07/07.
//  Copyright © 2020 yasudaakiho. All rights reserved.
//

import UIKit

class ShoulderViewController: UIViewController {


    @IBOutlet weak var shoulderwebview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            if let url = URL(string: "https://style.nikkei.com/article/DGXMZO97536920S6A220C1000000/"){
                 shoulderwebview.loadRequest(URLRequest(url: url))
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
