//
//  AViewController.swift
//  GSChange_Example
//
//  Created by Gesen on 2019/6/14.
//  Copyright © 2019 Gesen. All rights reserved.
//

import UIKit
import GSChange
import RxCocoa

class AViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    let post = BehaviorRelay<Post?>(value: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        likeButton.rx.tap
            .subscribe(onNext: { [unowned self] in
                GSChange.perform(
                    action:self.likeButton.isSelected ? .unlike : .like,
                    id: self.post.value?.id
                )
            })
            .disposed(by: rx.disposeBag)
        
        post
            .filterNil()
            .subscribe(onNext: { [unowned self] post in
                self.idLabel.text = post.id
                self.likeCountLabel.text = "\(post.likeCount ?? 0)"
                self.likeButton.isSelected = post.isLike == true
            })
            .disposed(by: rx.disposeBag)
        
        GSChange
            .bind(to: post)
            .disposed(by: rx.disposeBag)
    }

}
