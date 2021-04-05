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
import SwiftyJSON

protocol GameDependency: Dependency {
    var imageProvider:IImageProvider {get}
    var providerCore:ProviderCore {get}
    var characterProvider:Provider<ModelCharacter> {get}
    var jsonEncoder:IDataEncoder<[JSON]> {get}
}

class GameComponent: Component<GameDependency>, GameViewBuilder{
    var gameProvider: Provider<ModelGame> {
        return Provider<ModelGame>(core: dependency.providerCore, url: url, mapper: mapper, jsonFilename: jsonFilename)
    }
    
    var mapper: IDataMapper<[ModelGame]> {
        return GameMapper(encoder: dependency.jsonEncoder)
    }
    
    var jsonFilename:String {
        return "games.json"
    }
    
    var url:URL {
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
