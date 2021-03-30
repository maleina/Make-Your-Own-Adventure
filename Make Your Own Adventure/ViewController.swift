//
//  ViewController.swift
//  Make Your Own Adventure
//
//  Created by Maleina Bidek on 3/30/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(startOver))
    }
    
    @objc func startOver() {
            if let navigationController = navigationController {
                navigationController.popToRootViewController(animated: true)
            }
        }


}

