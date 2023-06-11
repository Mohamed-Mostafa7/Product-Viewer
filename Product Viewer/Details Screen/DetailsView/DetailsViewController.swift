//
//  DetailsViewController.swift
//  Product Viewer
//
//  Created by Mohamed Mostafa on 12/06/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let viewModel: DetailViewModel
        
    @IBOutlet weak var nameLabel: UILabel!
        
        init(viewModel: DetailViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detail"
        nameLabel.text = viewModel.product
        
    }
    
    
}
