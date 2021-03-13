//
//  RootComponent.swift
//  debug
//
//  Created by Mitchell Drew on 10/3/21.
//

import Foundation
import NeedleFoundation
import presenter
import provider

class RootComponent: BootstrapComponent, RootViewBuilder {
    var homeComponent: HomeComponent {
        return HomeComponent(parent: self)
    }
    
    var gameComponent: GameComponent {
        return GameComponent(parent: self)
    }
    
    var characterComponent: CharacterComponent {
        return CharacterComponent(parent: self)
    }
    
    var characterProvider:ICharacterProvider {
        return characterComponent.provider
    }
    
    var gameProvider:IGameProvider {
        return gameComponent.gameProvider
    }
    
    func rootView() -> UIViewController {
        return RootView(homeBuilder: homeComponent)
    }
    
    var imageProvider:IImageProvider {
        return ImageProvider(restManager: restManager, fileManager: fileManager)
    }
    
    var restManager:IRestManager {
        return URLSession.shared
    }
    
    var fileManager:IFileManager = FileManager()
}

protocol RootViewBuilder {
    func rootView() -> UIViewController
}
