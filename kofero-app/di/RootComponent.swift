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
    
    var rootPresenter: IRootPresenter {
        return RootPresenter(gameProvider: gameProvider)
    }
    
    var imageProvider:IImageProvider {
        return ImageProvider(core: providerCore)
    }
    
    var providerCore:ProviderCore {
        return ProviderCore(restManager: restManager, fileManager: fileManager, userDefaults: userDefaults, requestEncoder: requestEncoder)
    }
    
    var restManager:IRestManager {
        return URLSession.shared
    }
    
    var fileManager:IFileManager {
       return FileManager()
    }
    
    var userDefaults:IUserDefaults {
        return UserDefaults.standard
    }
    
    var jsonEncoder:IDataEncoder<[JSON]> {
        return JsonDataEncoder<[JSON]>()
    }
    
    var requestEncoder:IDataEncoder<[Int32]> {
        return JsonDataEncoder<[Int32]>()
    }
    
    var gameViewBuilder:GameViewBuilder{
        return gameComponent
    }
    
    var charViewBuilder:CharacterViewBuilder{
        return characterComponent
    }
    
    var moveViewBuilder:MoveViewBuilder{
        return moveComponent
    }
    
    var homeViewBuilder: HomeViewBuilder {
        return homeComponent
    }
    
    func rootView() -> UIViewController {
        return RootView(homeBuilder: homeComponent, presenter: rootPresenter)
    }
}

protocol RootViewBuilder {
    func rootView() -> UIViewController
}
