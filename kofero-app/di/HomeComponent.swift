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
    var gameProvider:IGameProvider {get}
    var imageProvider:IImageProvider {get}
}

class HomeComponent: Component<HomeDependency>, HomeViewBuilder {
    var homePresenter: IHomePresenter {
        return HomePresenter(gameProvider: dependency.gameProvider, imageProvider: dependency.imageProvider)
    }
    
    func homeView() -> IHomeView {
        return HomeView(homePresenter: homePresenter)
    }
}

protocol HomeViewBuilder {
    func homeView() -> IHomeView
}
