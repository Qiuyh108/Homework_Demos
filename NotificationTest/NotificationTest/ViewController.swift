//
//  ViewController.swift
//  NotificationTest
//
//  Created by 邱耀辉 on 2022/7/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: nil) { _ in
            print("block")
            
            let aa = 2 % 10
            print(aa)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationAction), name: UIApplication.willEnterForegroundNotification, object: self)
        
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: self)
    }

    @objc func notificationAction() {
        print(#function)
    }
}

