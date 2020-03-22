//
//  PostCollectionViewCell.swift
//  PerfectlyCrafted
//
//  Created by Ashli Rankin on 3/6/20.
//  Copyright © 2020 Ashli Rankin. All rights reserved.
//

import UIKit

/// `UICollectionViewCell` subclass which displays a post
final class PostCollectionViewCell: UICollectionViewCell {
    
    /// Contains the information needed to configure the `PostCollectionViewCell`
    struct ViewModel {
        
        /// The image of the post.
        let postImage: UIImage?
        
        /// The title of the post.
        let title: String
        
        /// The date the post was created.
        let date: Date
    }
    
    @IBOutlet private weak var moreOptionsButton: UIButton!
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var captionLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    /// The single point of configuration of the `PostCollectionViewCell`
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return 
            }
            postImageView.isHidden = viewModel.postImage == nil ? true : false
            postImageView.image = viewModel.postImage
            captionLabel.text = viewModel.title
            dateLabel.text = DateFormatter.format(date: viewModel.date)
        }
    }
    
    /// Is called when the edit button is tapped.
    var editButtonTapped: (() -> Void)?
    
    @IBAction private func moreOptionButtonTapped(_ sender: Any) {
        editButtonTapped?()
    }
}
