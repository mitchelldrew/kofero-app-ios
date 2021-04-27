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
    var bannerAdUnitId:String {get}
    var gameProvider:Provider<ModelGame> {get}
    var gameViewBuilder:GameViewBuilder {get}
    var imageProvider:IImageProvider {get}
    var freezer:IFreezer {get}
}

class HomeComponent: Component<HomeDependency>, HomeViewBuilder {
    var presenter: IHomePresenter {
        return HomePresenter(freezer: dependency.freezer, gameProvider: dependency.gameProvider, imageProvider: dependency.imageProvider)
    }
    
    func homeView() -> UIViewController {
        return HomeView(homePresenter: presenter, gameViewBuilder: dependency.gameViewBuilder, adUnitId: dependency.bannerAdUnitId)
    }
}

protocol HomeViewBuilder {
    func homeView() -> UIViewController
}
