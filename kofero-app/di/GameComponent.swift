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
    var userDefaults:IUserDefaults {get}
    var characterProvider:Provider<ModelCharacter> {get}
    var encoder:IEncoder {get}
}

class GameComponent: Component<GameDependency>, GameViewBuilder{
    var gameProvider: Provider<ModelGame> {
        return Provider(restManager: dependency.restManager, fileManager: dependency.fileManager, userDefaults: dependency.userDefaults, encoder: dependency.encoder, url: gamesUrl, mapper: mapper, jsonFilename: jsonFilename)
    }
    
    var mapper: DataMapper<[ModelGame]> {
        return GameMapper(encoder: dependency.encoder)
    }
    
    var jsonFilename:String {
        return "games.json"
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
