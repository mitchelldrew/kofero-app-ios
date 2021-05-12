//
//  CharacterView.swift
//  debug
//
//  Created by Mitchell Drew on 11/3/21.
//

import GoogleMobileAds
import Foundation
import presenter
import UIKit

class CharacterView: UIViewController, ICharacterView, UICollectionViewDelegate {
    
    private let presenter:ICharacterPresenter
    private let moveViewBuilder:MoveViewBuilder
    private let charId:Int32
    
    private var header:UIView?
    private var icon:UIImageView?
    private var nameLabel:UILabel?
    
    private var displayedChar: ModelCharacter?
    
    private var bannerView: GADBannerView?
    
    init(presenter:ICharacterPresenter, charId:Int32, moveViewBuilder:MoveViewBuilder){
        self.charId = charId
        self.presenter = presenter
        self.moveViewBuilder = moveViewBuilder
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemGray
        modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setView(view__: self)
        
        addHeader()
        addCollectionView()
        
        presenter.get(id: charId)
    }
    
    
    private func addCollectionView(){
    }
    
    private func addHeader(){
        header = UIView()
        icon = UIImageView()
        icon!.backgroundColor = .systemTeal
        icon!.translatesAutoresizingMaskIntoConstraints = false
        header!.addSubview(icon!)
        NSLayoutConstraint.activate([
            icon!.heightAnchor.constraint(equalToConstant: 100),
            icon!.widthAnchor.constraint(equalToConstant: 100),
            icon!.leadingAnchor.constraint(equalTo: header!.leadingAnchor)
        ])
        
        nameLabel = UILabel()
        nameLabel!.textColor = .black
        nameLabel!.text = "Character Name"
        nameLabel!.translatesAutoresizingMaskIntoConstraints = false
        header!.addSubview(nameLabel!)
        
        NSLayoutConstraint.activate([
            nameLabel!.trailingAnchor.constraint(equalTo: header!.trailingAnchor)
        ])
        
        view.addSubview(header!)
        header!.backgroundColor = .white
        header!.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            header!.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0.0),
            header!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header!.heightAnchor.constraint(equalToConstant: 100.0)
        ])
    }
    
    func display(moves: [ModelMove]) {
    }
    
    func display(character: ModelCharacter) {
        displayedChar = character
        DispatchQueue.main.async {
            self.nameLabel?.text = character.name
        }
    }
    
    func error(error: KotlinException) {
        
    }
    
    func display(url: String, imgBase64: String) {
        DispatchQueue.main.async {
            let image = UIImage(data: Data(base64Encoded: imgBase64)!)
            self.icon?.image = image
        }
    }
}
