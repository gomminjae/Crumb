//
//  ViewController.swift
//  Crumb
//
//  Created by gomminjae on 04/03/2024.
//  Copyright (c) 2024 gomminjae. All rights reserved.
//

import UIKit
import Crumb

class ViewController: UIViewController {
    
    let crumbView = CrumbView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(crumbView)
        crumbView.showParticles(with: UIImage(named: "cherry-blossom")!)
        crumbView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            crumbView.topAnchor.constraint(equalTo: view.topAnchor),
            crumbView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            crumbView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            crumbView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

