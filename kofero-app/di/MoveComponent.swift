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

protocol MoveDependency: Dependency {
    var restManager:IRestManager {get}
    var fileManager:IFileManager {get}
    var gameProvider:Provider<ModelGame> {get}
    var characterProvider:Provider<ModelCharacter> {get}
    var imageProvider:IImageProvider {get}
    var userDefaults:IUserDefaults {get}
    var encoder:IEncoder {get}
}

class MoveComponent: Component<MoveDependency>, MoveViewBuilder {
    var presenter: IMovePresenter{
        return MovePresenter(moveProvider: provider, charProvider: dependency.characterProvider, gameProvider: dependency.gameProvider, imageProvider: dependency.imageProvider)
    }
    
    var provider: Provider<ModelMove> {
        return Provider(restManager: dependency.restManager, fileManager: dependency.fileManager, userDefaults: dependency.userDefaults, encoder: dependency.encoder, url: url, mapper: mapper, jsonFilename: jsonFilename)
    }
    
    var jsonFilename:String {
        return "moves.json"
    }
    
    var mapper:DataMapper<[ModelMove]>{
        return MoveMapper(encoder: dependency.encoder)
    }
    
    var url:URL {
        return URL(string: "test")!
    }
    
    func moveView(moveId: Int32) -> IMoveView {
        return MoveView(presenter: presenter, moveId: moveId)
    }
}

protocol MoveViewBuilder{
    func moveView(moveId:Int32) -> IMoveView
}
