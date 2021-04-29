//
//  GameView.swift
//  debug
//
//  Created by Mitchell Drew on 10/3/21.
//

import Foundation
import presenter
import UIKit
import GoogleMobileAds

class GameView: UIViewController, IGameView, UICollectionViewDelegate {
    private let presenter:IGamePresenter
    private let characterViewBuilder:CharacterViewBuilder
    private let gameId:Int32
    private let adUnitId:String
    private var game:ModelGame? = nil
    private var characters = [ModelCharacter]()
    private var displayedItems = [Item<ModelCharacter>]()
    
    
    private var collectionView:UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Item<ModelCharacter>>!
    var snapshot: NSDiffableDataSourceSnapshot<Section, Item<ModelCharacter>>!
    private var bannerView: GADBannerView?
    
    enum Section {
        case main
    }
    
    init(gamePresenter:IGamePresenter, gameId:Int32, characterViewBuilder:CharacterViewBuilder, adUnitId:String) {
        self.presenter = gamePresenter
        self.characterViewBuilder = characterViewBuilder
        self.gameId = gameId
        self.adUnitId = adUnitId
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .fullScreen
    }
    
    override func viewDidLoad() {
        presenter.setView(view: self)
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView!)
        buildCollectionView()
        view.backgroundColor = .systemPink
        presenter.showGame(id: gameId)
    }
    
    func buildCollectionView(){
        let gridLayout = GridCollectionViewLayout(numberOfColumns: 4)
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: gridLayout)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemYellow
        collectionView.delegate = self
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0.0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            collectionView.bottomAnchor.constraint(equalTo: bannerView!.topAnchor, constant: 0.0),
        ])
        let cellRegistration = UICollectionView.CellRegistration<GameViewItemGridCell, Item<ModelCharacter>> { (cell, indexPath, item) in
            cell.item = item
        }
        dataSource = UICollectionViewDiffableDataSource<Section, Item<ModelCharacter>>(collectionView: collectionView) {
                (collectionView: UICollectionView, indexPath: IndexPath, identifier: Item<ModelCharacter>) -> UICollectionViewCell? in
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        return cell
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.adUnitID = adUnitId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        view.addSubview(bannerView)
        NSLayoutConstraint.activate([
            bannerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func display(characters: [ModelCharacter]) {
        self.characters = characters
        displayedItems.removeAll()
        snapshot = NSDiffableDataSourceSnapshot<Section, Item<ModelCharacter>>()
        snapshot.appendSections([.main])
    }
    
    func display(game: ModelGame) {
        self.game = game
    }
    
    func error(error: KotlinException) {
    }
    
    func display(url: String, imgBase64: String) {
            for character in characters{
                if character.iconUrl == url && !displayedItems.contains{item in return item.item.uid == character.uid} {
                    let image = UIImage(data: Data(base64Encoded: imgBase64)!)!
                    let item = Item(item: character, image: image)
                    snapshot.appendItems([Item<ModelCharacter>](arrayLiteral: item), toSection: .main)
                    displayedItems.append(item)
                }
            }
            dataSource.apply(snapshot, animatingDifferences: true)
    }
}