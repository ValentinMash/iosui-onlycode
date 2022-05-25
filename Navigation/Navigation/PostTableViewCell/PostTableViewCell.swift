//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Ilya on 12.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var post: Post? {
        didSet {
            guard let post = post else { return }
            postImageView.image = UIImage(named: post.imageName)
            authorLabel.text = post.author
            descriptionLabel.text = post.description
            likesLabel.text = "Likes: \(post.likes)"
            viewsLabel.text = "Views: \(post.views)"
        }
    }
    
    let postImageView: UIImageView = {
        let image = UIImage(named: "ava")
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Author"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Description"
        return label
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Likes:"
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Views:"
        return label
    }()
    
    func layout() {
        addSubview(postImageView)
        addSubview(authorLabel)
        addSubview(descriptionLabel)
        addSubview(likesLabel)
        addSubview(viewsLabel)
        
        let topAuthorLabel = authorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        let leadingAuthorLabel = authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        let trailingAuthorLabel = authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        
        let topPostImageView = postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8)
        let leadingPostImageView = postImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailingPostImageView = postImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let heightPostImageView = postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 1)
        
        let topDescriptionLabel = descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16)
        let leadingDescriptionLabel = descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        let trailingDescriptionLabel = descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        
        let topLikesLabel = likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16)
        let leadingLikesLabel = likesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        let bottomLikesLabel = likesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        
        let topViewsLabel = viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16)
        let trailingViewsLabel = viewsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        let bottomViewsLabel = viewsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        
        NSLayoutConstraint.activate([
            topAuthorLabel, leadingAuthorLabel, trailingAuthorLabel, topPostImageView, leadingPostImageView, trailingPostImageView, heightPostImageView, topDescriptionLabel, leadingDescriptionLabel, trailingDescriptionLabel, topLikesLabel, leadingLikesLabel, bottomLikesLabel, topViewsLabel, trailingViewsLabel, bottomViewsLabel
        ])
        
    }

}
