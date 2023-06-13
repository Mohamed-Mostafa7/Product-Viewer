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
    }
    
    func bindToCollectionView() {
        viewModel.products.bind(to: collectionView.rx.items(cellIdentifier: CardCollectionViewCell.identifier, cellType: CardCollectionViewCell.self)) { _, item, cell in
            guard let product = item.product else { return }
            cell.configure(item: product)
        }
        .disposed(by: disposeBag)
    }
    
    func didSelectItem() {
        
        collectionView.rx.modelSelected(Products.self).subscribe(onNext: { [weak self] products in
            guard let product = products.product else { return }
            self?.viewModel.selectedItem.onNext(product)
        }).disposed(by: disposeBag)
        
    }
    
}

// MARK: - Design the UI Here.
extension MainViewController {
    
    func changeTheCollectionViewCellSize() {
        let layout = UICollectionViewFlowLayout()
        let ViewWidth = view.frame.size.width
        let cellWidth = ViewWidth/2.3
        let cellHeight = ViewWidth/1.9
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.collectionViewLayout = layout
    }
    
    func registerCardCollectionViewCell() {
        collectionView.register(CardCollectionViewCell.nib(), forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
    }
}
