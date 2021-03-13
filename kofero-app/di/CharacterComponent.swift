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
    var moveProvider:IMoveProvider {get}
    var imageProvider: IImageProvider {get}
    var restManager:IRestManager {get}
    var fileManager:IFileManager {get}
    var charUrl:URL {get}
}

class CharacterComponent: Component<CharacterDependency>, CharacterViewBuilder {
    var provider: ICharacterProvider {
        return CharacterProvider(restManager: dependency.restManager, fileManager: dependency.fileManager, serializer: serializer, charUrl: dependency.charUrl)
    }
    
    var serializer: CharacterSerializer {
        return CharacterSerializer()
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
