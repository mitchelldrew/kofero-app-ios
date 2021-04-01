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
import SwiftyJSON

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
    
    var moveComponent: MoveComponent {
        return MoveComponent(parent: self)
    }
    
    var moveProvider: Provider<ModelMove> {
        return moveComponent.provider
    }
    
    var characterProvider: Provider<ModelCharacter> {
        return characterComponent.provider
    }
    
    var gameProvider: Provider<ModelGame> {
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
    
    var fileManager:IFileManager{
       return FileManager()
    }
    
    var userDefaults:IUserDefaults {
        return UserDefaults.standard
    }
    
    var encoder:IEncoder {
        return JSONEncoder()
    }
}

protocol RootViewBuilder {
    func rootView() -> UIViewController
}
