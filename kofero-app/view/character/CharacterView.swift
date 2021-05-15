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


struct MoveItem: Hashable {
    let uuid = UUID()
    let title: String
    var children: [MoveString]
    
    
    static func ==(lhs: MoveItem, rhs: MoveItem) -> Bool {
        return lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

struct MoveString: Hashable {
    let uuid = UUID()
    let string: String
    
    static func ==(lhs: MoveString, rhs: MoveString) -> Bool {
        return lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

enum ListItem: Hashable {
    case header(MoveItem)
    case symbol(MoveString)
}



class CharacterView: UIViewController, ICharacterView, UICollectionViewDelegate {
    
    private let presenter:ICharacterPresenter
    private let moveViewBuilder:MoveViewBuilder
    private let charId:Int32
    
    private var header:UIView?
    private var icon:UIImageView?
    private var nameLabel:UILabel?
    
    private var displayedChar: ModelCharacter?
    
    private var bannerView: GADBannerView?
    
    private var collectionView:UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, ListItem>!
    
    enum Section {
        case main
    }
    
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
        
        
        // MARK: Create list layout
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        
        // MARK: Configure collection view
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
        view.addSubview(collectionView)
        
        // Make collection view take up the entire view
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: header!.bottomAnchor, constant: 0.0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
        ])
        
        // MARK: Cell registration
        let headerCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, MoveItem> {
            (cell, indexPath, headerItem) in
            
            // Set headerItem's data to cell
            var content = cell.defaultContentConfiguration()
            content.text = headerItem.title
            cell.contentConfiguration = content
            
            // Add outline disclosure accessory
            // With this accessory, the header cell's children will expand / collapse when the header cell is tapped.
            let headerDisclosureOption = UICellAccessory.OutlineDisclosureOptions(style: .header)
            cell.accessories = [.outlineDisclosure(options:headerDisclosureOption)]
        }
        
        let symbolCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, String> {
            (cell, indexPath, symbolItem) in
            
            // Set symbolItem's data to cell
            var content = cell.defaultContentConfiguration()
            content.text = symbolItem
            cell.contentConfiguration = content
        }
        
        // MARK: Initialize data source
        dataSource = UICollectionViewDiffableDataSource<Section, ListItem>(collectionView: collectionView) {
            (collectionView, indexPath, listItem) -> UICollectionViewCell? in
            
            switch listItem {
            case .header(let headerItem):
            
                // Dequeue header cell
                let cell = collectionView.dequeueConfiguredReusableCell(using: headerCellRegistration,
                                                                        for: indexPath,
                                                                        item: headerItem)
                return cell
            
            case .symbol(let symbolItem):
                
                // Dequeue symbol cell
                let cell = collectionView.dequeueConfiguredReusableCell(using: symbolCellRegistration,
                                                                        for: indexPath,
                                                                        item: symbolItem.string)
                return cell
            }
        }
        
        // MARK: Setup snapshots
        var dataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, ListItem>()

        // Create a section in the data source snapshot
        dataSourceSnapshot.appendSections([.main])
        dataSource.apply(dataSourceSnapshot)
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
        
        // Create a section snapshot for main section
        var sectionSnapshot = NSDiffableDataSourceSectionSnapshot<ListItem>()

        for move in moves {
           
            
            var moveItem = MoveItem(title: move.name, children: [])
            // Create a header ListItem & append as parent
            let headerListItem = ListItem.header(moveItem)
            sectionSnapshot.append([headerListItem])
            
            
            moveItem.children.append(MoveString(string: move.startup))
            // Create an array of symbol ListItem & append as children of headerListItem

            var symbolListItemArray = [ListItem]()
            symbolListItemArray.append(ListItem.symbol(MoveString(string: "Startup: \(move.startup)")))
            symbolListItemArray.append(ListItem.symbol(MoveString(string: "Active: \(move.active)")))
            symbolListItemArray.append(ListItem.symbol(MoveString(string: "Recovery: \(move.recovery)")))
            symbolListItemArray.append(ListItem.symbol(MoveString(string: "HitAdv: \(move.hitAdv)")))
            symbolListItemArray.append(ListItem.symbol(MoveString(string: "BlockAdv: \(move.blockAdv)")))
            symbolListItemArray.append(ListItem.symbol(MoveString(string: "Notes: \(move.notes)")))
            sectionSnapshot.append(symbolListItemArray, to: headerListItem)
            
        }
        // Apply section snapshot to main section
        dataSource.apply(sectionSnapshot, to: .main, animatingDifferences: false)
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
