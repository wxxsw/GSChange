//
//  PostCell.swift
//  GSChange_Example
//
//  Created by Gesen on 2019/6/14.
//  Copyright © 2019 Gesen. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    static var nib: UINib { return UINib(nibName: "PostCell", bundle: nil) }

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    func set(post: Post) {
        idLabel.text = "id:\(post.id ?? "")"
        likeLabel.text = post.isLike == true ? "Liked" : ""
        likeCountLabel.text = "Count:\(post.likeCount ?? 0)"
    }
    
}
