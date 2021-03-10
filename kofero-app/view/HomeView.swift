//
//  HomeView.swift
//  debug
//
//  Created by Mitchell Drew on 10/3/21.
//

import Foundation
import presenter
import UIKit

class HomeView: UIViewController, IHomeView{
    private let presenter:IHomePresenter
    
    init(homePresenter:IHomePresenter) {
        self.presenter = homePresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(url: String, imgBase64: String) {
        
    }
    
    func display(games: [ModelGame]) {
        
    }
    
    func error(error: KotlinException) {
        
    }
    
}
