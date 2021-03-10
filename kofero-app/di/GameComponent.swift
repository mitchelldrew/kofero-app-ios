//
//  GameComponent.swift
//  debug
//
//  Created by Mitchell Drew on 10/3/21.
//

import Foundation
import NeedleFoundation
import presenter
import provider

protocol GameDependency: Dependency {
    var restManager:IRestManager {get}
    var fileManager:IFileManager {get}
    var serializer:GameSerializer {get}
    var imageProvider:IImageProvider {get}
    var characterProvider:ICharacterProvider {get}
    var gamesUrl:URL {get}
}

class GameComponent: Component<GameDependency>, GameViewBuilder{
    var gameProvider: IGameProvider {
        return GameProvider(restManager: dependency.restManager, fileManager: dependency.fileManager, serializer: dependency.serializer, gamesUrl: dependency.gamesUrl)
    }
    
    var gamePresenter: IGamePresenter {
        return GamePresenter(characterProvider: dependency.characterProvider, imageProvider: dependency.imageProvider)
    }
    

    func gameView() -> IGameView {
        return GameView(gamePresenter: gamePresenter)
    }
    
}

protocol GameViewBuilder{
    func gameView() -> IGameView
}
