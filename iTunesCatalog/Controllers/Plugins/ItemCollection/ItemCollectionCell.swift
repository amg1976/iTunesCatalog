//
//  ItemCollectionCell.swift
//  iTunesCatalog
//
//  Created by Adriano Goncalves on 07/07/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import UIKit

/// Cell used for displaying Feed items on a collection view
final class ItemCollectionCell: UICollectionViewCell {
    
    static var reusableIdentifier: String {
        return String(describing: ItemCollectionCell.self)
    }
    
    private var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private (set) var item: ItemDetailViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.pin(toView: contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withItem item: ItemDetailViewModel) {
        self.item = item
        self.backgroundColor = .lightGray
        
        imageView.startActivityIndicator()
        
        item.getImage { [weak self] result in
            self?.imageView.stopActivityIndicator(withResult: result)
        }
    }
    
}
