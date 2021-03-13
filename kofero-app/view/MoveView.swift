//
//  MoveView.swift
//  debug
//
//  Created by Mitchell Drew on 12/3/21.
//

import Foundation
import presenter
import provider
import UIKit

class MoveView: UIViewController, IMoveView {
    private let presenter:IMovePresenter
    private let moveId:Int32
    
    init(presenter:IMovePresenter, moveId:Int32) {
        self.presenter = presenter
        self.moveId = moveId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
