//
//  HomeView.swift
//  debug
//
//  Created by Mitchell Drew on 10/3/21.
//

import Foundation
import presenter
import UIKit
import GoogleMobileAds

class HomeView: UIViewController, IHomeView, UICollectionViewDelegate{
    private let presenter:IHomePresenter
    private let gameViewBuilder: GameViewBuilder
    private let adUnitId:String
    
    private var collectionView:UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Item<ModelObj>>!
    var snapshot: NSDiffableDataSourceSnapshot<Section, Item<ModelObj>>!
    private var bannerView: GADBannerView?
    private var games = [ModelGame]()
    private var displayedItems = [Item]()
    
    
    enum Section{
        case main
    }
    
    init(homePresenter:IHomePresenter, gameViewBuilder:GameViewBuilder, adUnitId:String) {
        self.presenter = homePresenter
        self.gameViewBuilder = gameViewBuilder
        self.adUnitId = adUnitId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        presenter.setView(view_: self)
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView!)
        buildCollectionView()
        presenter.showGames()
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
    
    func buildCollectionView(){
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        let gridLayout = GridCollectionViewLayout(numberOfColumns: 4)
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: gridLayout)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGreen
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0.0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            collectionView.bottomAnchor.constraint(equalTo: bannerView!.topAnchor, constant: 0.0),
        ])
        let cellRegistration = UICollectionView.CellRegistration<HomeItemGridCell, Item<ModelObj>> { (cell, indexPath, item) in
            cell.item = item
        }
        dataSource = UICollectionViewDiffableDataSource<Section, Item<ModelObj>>(collectionView: collectionView) {
                (collectionView: UICollectionView, indexPath: IndexPath, identifier: Item<ModelObj>) -> UICollectionViewCell? in
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        return cell
        }
    }
    
    func display(url: String, imgBase64: String) {
        for game in games{
            if game.iconUrl == url && !displayedItems.contains{item in return item.item.id == game.id} {
                let image = UIImage(data: Data(base64Encoded: imgBase64)!)!
                let item = Item(item: game as ModelObj, image: image)
                snapshot.appendItems([Item<ModelObj>](arrayLiteral: item), toSection: .main)
                displayedItems.append(item)
            }
        }
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func display(games: [ModelGame]) {
        self.games = games
        displayedItems.removeAll()
        snapshot = NSDiffableDataSourceSnapshot<Section, Item<ModelObj>>()
        snapshot.appendSections([.main])
    }
    
    func error(error: KotlinException) {
        print(error)
    }
}
