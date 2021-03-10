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
    
    init(gamePresenter:IGamePresenter) {
        self.presenter = gamePresenter
        super.init(nibName: nil, bundle: nil)
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
