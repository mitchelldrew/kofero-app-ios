//
//  CharacterView.swift
//  debug
//
//  Created by Mitchell Drew on 11/3/21.
//

import Foundation
import presenter
import UIKit

class CharacterView: UIViewController, ICharacterView {
    private let presenter:ICharacterPresenter
    private let charId:Int32
    
    init(presenter:ICharacterPresenter, charId:Int32){
        self.charId = charId
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(moves: [ModelMove]) {
        
    }
    
    func display(character: ModelCharacter) {
        
    }
    
    func error(error: KotlinException) {
        
    }
}
