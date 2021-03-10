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
    
    func rootView() -> UIViewController {
        return RootView(homeBuilder: homeComponent)
    }
    
    var imageProvider:IImageProvider {
        return ImageProvider(restManager: restManager, fileManager: fileManager)
    }
    
    var gameProvider:IGameProvider {
        return GameProvider(restManager: restManager, fileManager: fileManager, serializer: gameSerializer, gamesUrl: gamesUrl)
    }
    
    var gameSerializer: GameSerializer {
        return GameSerializer()
    }
    
    var gamesUrl:URL{
        return URL(string:"test")!
    }
    
    var restManager:IRestManager {
        return URLSession.shared
    }
    
    var fileManager:IFileManager {
        return FileManager()
    }
}

protocol RootViewBuilder {
    func rootView() -> UIViewController
}
