//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Hau Lam on 12/5/20.
//  Copyright © 2020 Hau Lam. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webview : WKWebView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url : url);
            webview.load(request);
        }
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}
