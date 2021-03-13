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
    var imageProvider:IImageProvider {get}
    var characterProvider:ICharacterProvider {get}
}

class GameComponent: Component<GameDependency>, GameViewBuilder{
    var gameProvider: IGameProvider {
        return GameProvider(restManager: dependency.restManager, fileManager: dependency.fileManager, serializer: serializer, gamesUrl: gamesUrl)
    }
    
    var serializer: GameSerializer {
        return GameSerializer()
    }
    
    var gamesUrl:URL {
        return URL(string: "test")!
    }
    
    var gamePresenter: IGamePresenter {
        return GamePresenter(characterProvider: dependency.characterProvider, gameProvider: gameProvider, imageProvider: dependency.imageProvider)
    }
    

    func gameView(id:Int32) -> IGameView {
        return GameView(gamePresenter: gamePresenter, gameId:id)
    }
    
}

protocol GameViewBuilder{
    func gameView(id:Int32) -> IGameView
}
