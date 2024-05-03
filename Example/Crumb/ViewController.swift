//
//  ViewController.swift
//  Crumb
//
//  Created by gomminjae on 04/03/2024.
//  Copyright (c) 2024 gomminjae. All rights reserved.
// 

import UIKit
import Crumb
import SnapKit


extension UIViewController {
    @objc func injected() {
        viewDidLoad()
    }
}

class ViewController: UIViewController {
    
    let crumbView = CrumbView()
    let testView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        view.addSubview(crumbView)
        
        crumbView.particleImage = UIImage(named: "bread")
        crumbView.enableGestures = [.pin,.tap]
        crumbView.addSubview(button)
        crumbView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            crumbView.topAnchor.constraint(equalTo: view.topAnchor),
            crumbView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            crumbView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            crumbView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        // Do any additional setup after loading the view, typically from a nib.
        button.backgroundColor = .red
        button.snp.makeConstraints {
            $0.centerX.equalTo(crumbView)
            $0.centerY.equalTo(crumbView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

