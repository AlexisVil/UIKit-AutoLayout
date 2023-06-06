//
//  ViewController.swift
//  UiKit2-AutoLayout
//
//  Created by Alexis Vilchis on 06/06/23.
//

import UIKit

class ViewController: UIViewController {
    override func loadView() {
        self.view = OnboardingView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

