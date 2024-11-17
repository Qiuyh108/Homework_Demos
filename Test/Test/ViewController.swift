//
//  ViewController.swift
//  Test
//
//  Created by 邱耀辉 on 2023/3/5.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let test = StructTest()
        test.test()
        
        
    }

    func abcd() {
        let tv: UITableView = .init()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "reuseId")
    }
}

class TestClass {
    
}

struct StructTest {
    private (set) var count: Int = 0
    
    
    
    fileprivate func test() {
        
    }
}
