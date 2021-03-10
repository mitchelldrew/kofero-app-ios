//
//  ViewController.swift
//  kofero-app
//
//  Created by Mitchell Drew on 5/3/21.
//

import UIKit

class RootView: UINavigationController {
    private let homeBuilder:HomeViewBuilder
    
    init(homeBuilder:HomeViewBuilder){
        self.homeBuilder = homeBuilder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello world")
        view.backgroundColor = .systemRed
    }


}

