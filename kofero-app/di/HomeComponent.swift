//
//  HomeComponent.swift
//  debug
//
//  Created by Mitchell Drew on 10/3/21.
//

import Foundation
import NeedleFoundation
import presenter
import provider

protocol HomeDependency: Dependency {
    var gameProvider:Provider<ModelGame> {get}
    var gameViewBuilder:GameViewBuilder {get}
    var imageProvider:IImageProvider {get}
}

class HomeComponent: Component<HomeDependency>, HomeViewBuilder {
    var presenter: IHomePresenter {
        return HomePresenter(gameProvider: dependency.gameProvider, imageProvider: dependency.imageProvider)
    }
    
    func homeView() -> UIViewController {
        return HomeView(homePresenter: presenter, gameViewBuilder: dependency.gameViewBuilder)
    }
}

protocol HomeViewBuilder {
    func homeView() -> UIViewController
}
