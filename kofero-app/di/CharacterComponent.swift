//
//  CharacterComponent.swift
//  debug
//
//  Created by Mitchell Drew on 11/3/21.
//

import Foundation
import NeedleFoundation
import presenter
import SwiftyJSON
import provider

protocol CharacterDependency: Dependency {
    var moveProvider:Provider<ModelMove> {get}
    var imageProvider: IImageProvider {get}
    var providerCore:ProviderCore {get}
    var jsonEncoder:IDataEncoder<[JSON]> {get}
}

class CharacterComponent: Component<CharacterDependency>, CharacterViewBuilder {
    var provider: Provider<ModelCharacter> {
        return Provider<ModelCharacter>(core: dependency.providerCore, url: url, mapper: mapper, jsonFilename: jsonFilename)
    }
    
    var jsonFilename:String {
        return "char"
    }
    
    var url: URL {
        return URL(string: "test!")!
    }
    
    var mapper: IDataMapper<[ModelCharacter]> {
        return CharacterMapper(encoder: dependency.jsonEncoder)
    }
    
    var presenter: ICharacterPresenter {
        return CharacterPresenter(moveProvider: dependency.moveProvider, imageProvider: dependency.imageProvider)
    }
    
    func characterView(id:Int32) -> ICharacterView {
        return CharacterView(presenter: presenter, charId: id)
    }
}

protocol CharacterViewBuilder {
    func characterView(id:Int32) -> ICharacterView
}
