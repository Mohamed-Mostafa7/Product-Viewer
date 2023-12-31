//
//  MainViewController.swift
//  Product Viewer
//
//  Created by Mohamed Mostafa on 10/06/2023.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    private let viewModel: MainViewModel
    private let coordinator: Coordinator
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    init(viewModel: MainViewModel, coordinator: Coordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product Viewer"
        
        registerCardCollectionViewCell()
        
        viewModel.viewDidLoad()
        bindToCollectionView()
        didSelectItem()
    }
    
    override func viewWillLayoutSubviews() {
        changeTheCollectionViewCellSize()
        viewModel.getStoredData()
    }
    
    func bindToCollectionView() {
        viewModel.productCoreData.bind(to: collectionView.rx.items(cellIdentifier: CardCollectionViewCell.identifier, cellType: CardCollectionViewCell.self)) { _, product, cell in
            cell.configure(item: product)
        }
        .disposed(by: disposeBag)
    }
    
    func didSelectItem() {
        
        collectionView.rx.modelSelected(ProductCoreData.self).subscribe(onNext: { [weak self] product in
            self?.viewModel.selectedItem.onNext(product)
        }).disposed(by: disposeBag)
        
    }
    
}

// MARK: - Design the UI Here.
extension MainViewController {
    
    func changeTheCollectionViewCellSize() {
        let layout = UICollectionViewFlowLayout()
        let ViewWidth = view.frame.size.width
        let cellWidth = ViewWidth/2.5
        let cellHeight = ViewWidth/2
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        collectionView.collectionViewLayout = layout
    }
    
    func registerCardCollectionViewCell() {
        collectionView.register(CardCollectionViewCell.nib(), forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
    }
}
