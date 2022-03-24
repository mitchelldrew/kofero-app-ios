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


class HomeView: AdViewController, IHomeView, UICollectionViewDelegate {
    private let interactor:IHomeInteractor
    
    private var collectionView:UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item<ModelObj>>!
    private var snapshot: NSDiffableDataSourceSnapshot<Section, Item<ModelObj>>!
    private var games = [ModelGame]()
    private var displayedItems = [Item]()
    
    enum Section{
        case main
    }
    
    init(interactor:IHomeInteractor, adUnitId:String) {
        self.interactor = interactor
        super.init(adUnitId: adUnitId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        interactor.setView(view: self)
        addBannerView()
        addHeader("Home")
        buildGameCollectionView()
        interactor.viewResumed()
    }
    
    private func addBannerView(){
        setupBannerView()
        view.addSubview(bannerView)
        NSLayoutConstraint.activate([
            bannerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func buildGameCollectionView(){
        let gridLayout = GridCollectionViewLayout(numberOfColumns: 2)
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: gridLayout)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: header.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bannerView.topAnchor)
        ])
        let cellRegistration = UICollectionView.CellRegistration<HomeViewItemGridCell, Item<ModelObj>> { (cell, indexPath, item) in
            cell.item = item
        }
        dataSource = UICollectionViewDiffableDataSource<Section, Item<ModelObj>>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Item<ModelObj>) -> UICollectionViewCell? in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        interactor.gamePressed(game: games[indexPath.item])
    }
    
    func display(url: String, imgBase64: String) {
        for game in games{
            if game.iconUrl == url && !displayedItems.contains(where: {item in return item.item.uid == game.uid}) {
                let image = UIImage(data: Data(base64Encoded: imgBase64)!)!
                let item = Item(item: game as ModelObj, image: image)
                snapshot.appendItems([Item<ModelObj>](arrayLiteral: item), toSection: .main)
                displayedItems.append(item)
            }
        }
        guard let dSource = dataSource else { return }
        
        dSource.apply(snapshot, animatingDifferences: true)
    }
    
    func displayGames(games: [ModelGame]) {
        self.games = games
        displayedItems.removeAll()
        snapshot = NSDiffableDataSourceSnapshot<Section, Item<ModelObj>>()
        snapshot.appendSections([.main])
    }
    
    
    func displayFavs(favorites: [ModelObj]) {
        
    }
    
    func error(e error: KotlinException) {
        print(error)
    }
}
