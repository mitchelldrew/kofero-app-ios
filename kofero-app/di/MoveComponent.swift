//
//  MoveComponent.swift
//  debug
//
//  Created by Mitchell Drew on 12/3/21.
//

import Foundation
import presenter
import provider
import NeedleFoundation

protocol MoveDependency {
    var restManager:IRestManager {get}
    var fileManager:IFileManager {get}
    var gameProvider:IGameProvider {get}
    var charProvider:ICharacterProvider {get}
    var imageProvider:IImageProvider {get}
}

class MoveComponent: Component<MoveDependency>, MoveViewBuilder {
    var presenter: IMovePresenter{
        return MovePresenter(moveProvider: provider, charProvider: dependency.charProvider, gameProvider: dependency.gameProvider, imageProvider: dependency.imageProvider)
    }
    
    var provider: IMoveProvider {
        return MoveProvider()
    }
    
    func moveView(moveId: Int32) -> IMoveView {
        return MoveView(presenter: presenter, moveId: moveId)
    }
}

protocol MoveViewBuilder{
    func moveView(moveId:Int32) -> IMoveView
}
