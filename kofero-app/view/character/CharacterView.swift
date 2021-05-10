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
    private let moveViewBuilder:MoveViewBuilder
    private let charId:Int32
    
    init(presenter:ICharacterPresenter, charId:Int32, moveViewBuilder:MoveViewBuilder){
        self.charId = charId
        self.presenter = presenter
        self.moveViewBuilder = moveViewBuilder
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemGray
        modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setView(view__: self)
        presenter.get(id: charId)
    }
    
    func display(moves: [ModelMove]) {
        print(moves)
    }
    
    func display(character: ModelCharacter) {
        print(character)
    }
    
    func error(error: KotlinException) {
    }
    
    
    func display(url: String, imgBase64: String) {
        print(url)
    }
}
