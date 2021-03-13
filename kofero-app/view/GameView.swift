//
//  GameView.swift
//  debug
//
//  Created by Mitchell Drew on 10/3/21.
//

import Foundation
import presenter
import UIKit

class GameView: UIViewController, IGameView {
    private let presenter:IGamePresenter
    private let gameId:Int32
    
    init(gamePresenter:IGamePresenter, gameId:Int32) {
        self.presenter = gamePresenter
        self.gameId = gameId
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        presenter.setView(view: self)
        presenter.showGame(id: gameId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(characters: [ModelCharacter]) {
        
    }
    
    func display(game: ModelGame) {
        
    }
    
    func error(error: KotlinException) {
        
    }
    
}
