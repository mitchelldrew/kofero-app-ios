//
//  CharacterComponent.swift
//  debug
//
//  Created by Mitchell Drew on 11/3/21.
//

import Foundation
import NeedleFoundation
import presenter
import provider

protocol CharacterDependency: Dependency {
    var moveProvider:Provider<ModelMove> {get}
    var imageProvider: IImageProvider {get}
    var userDefaults:IUserDefaults {get}
    var restManager:IRestManager {get}
    var fileManager:IFileManager {get}
    var encoder:IEncoder {get}
}

class CharacterComponent: Component<CharacterDependency>, CharacterViewBuilder {
    var provider: Provider<ModelCharacter> {
        return Provider(restManager: dependency.restManager, fileManager: dependency.fileManager, userDefaults: dependency.userDefaults, encoder: dependency.encoder, url: url, mapper: mapper, jsonFilename: jsonFilename)
    }
    
    var jsonFilename:String {
        return "characters.json"
    }
    
    var url: URL {
        return URL(string: "test!")!
    }
    
    var mapper: DataMapper<[ModelCharacter]> {
        return CharacterMapper(encoder: dependency.encoder)
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
