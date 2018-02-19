//
//  ViewController.swift
//  TestUniversalLinks
//
//  Created by matsuda on 2018/02/19.
//  Copyright © 2018年 matsuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapButton(_ sender: Any) {
        let path = "https://universal-links-site.s3.amazonaws.com/index.html"
        let url = URL(string: path)!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
