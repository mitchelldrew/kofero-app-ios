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
    private let gameViewBuilder: GameViewBuilder
    
    init(homePresenter:IHomePresenter, gameViewBuilder:GameViewBuilder) {
        self.presenter = homePresenter
        self.gameViewBuilder = gameViewBuilder
        print("init!!")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        presenter.setView(view_: self)
        print("hello, world!!")
    }
    
    func display(url: String, imgBase64: String) {
        
    }
    
    func display(games: [ModelGame]) {
        
    }
    
    func error(error: KotlinException) {
        
    }
    
}
