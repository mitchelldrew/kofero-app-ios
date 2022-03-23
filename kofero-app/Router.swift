//
//  Router.swift
//  debug
//
//  Created by Mitchell Drew on 21/3/22.
//

import Foundation
import provider
import presenter
import UIKit

class HomeRouter: IRouter {
    let gameViewBuilder: GameViewBuilder
    let application: UIApplication
    let gameProvider: Provider<ModelGame>
    
    public init(_ gameViewBuilder:GameViewBuilder, _ application:UIApplication, _ gameProvider: Provider<ModelGame>){
        self.application = application
        self.gameProvider = gameProvider
        self.gameViewBuilder = gameViewBuilder
    }
    
    func routeTo(view: ModelViewTag, uid: Int32) -> Bool {
        var ids = [KotlinInt]()
        ids.append(uid.toKotlinInt())
        gameProvider.addListener(listener__: Listener(uid, application, gameViewBuilder))
        gameProvider.get(ids: ids)
        return view == .gameView
    }
    
    class Listener: IProviderListener {
        let uid: Int32
        let application: UIApplication
        let gameViewBuilder: GameViewBuilder
        
        init(_ uid: Int32, _ application: UIApplication, _ builder:GameViewBuilder){
            self.uid = uid
            self.application = application
            self.gameViewBuilder = builder
        }
        
        func onError(ids: [KotlinInt], error: KotlinException) {
            print(error)
        }
        
        func onReceive(ids: [KotlinInt], elements: [ModelObj]) {
            if(ids.count == 1 && ids.first?.int32Value == uid){
                application.windows.first(where: \.isKeyWindow)?.rootViewController?.present(gameViewBuilder.gameView(id: uid), animated: true, completion: {})
            }
        }
    }
}
