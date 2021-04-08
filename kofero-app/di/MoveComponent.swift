//
//  MoveComponent.swift
//  debug
//
//  Created by Mitchell Drew on 12/3/21.
//

import Foundation
import presenter
import provider
import SwiftyJSON
import NeedleFoundation

protocol MoveDependency: Dependency {
    var providerCore:ProviderCore {get}
    var gameProvider:Provider<ModelGame> {get}
    var characterProvider:Provider<ModelCharacter> {get}
    var imageProvider:IImageProvider {get}
    var jsonEncoder:IDataEncoder<[JSON]> {get}
}

class MoveComponent: Component<MoveDependency>, MoveViewBuilder {
    var presenter: IMovePresenter{
        return MovePresenter(moveProvider: provider, charProvider: dependency.characterProvider, gameProvider: dependency.gameProvider, imageProvider: dependency.imageProvider)
    }
    
    var provider: Provider<ModelMove> {
        return Provider<ModelMove>(core: dependency.providerCore, url: url, mapper: mapper, jsonFilename: jsonFilename)
    }
    
    var jsonFilename:String {
        return "move"
    }
    
    var mapper:IDataMapper<[ModelMove]>{
        return MoveMapper(encoder: dependency.jsonEncoder)
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
