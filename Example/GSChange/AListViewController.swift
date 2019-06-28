//
//  AListViewController.swift
//  GSChange_Example
//
//  Created by Gesen on 2019/6/14.
//  Copyright © 2019 Gesen. All rights reserved.
//

import UIKit
import RxCocoa
import GSChange

class AListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let posts = BehaviorRelay<[Post]>(value: [
        Post(id: "1", isLike: true, likeCount: 10),
        Post(id: "2", isLike: false, likeCount: nil),
        Post(id: "3", isLike: false, likeCount: 5),
        Post(id: "4", isLike: false, likeCount: 3),
        Post(id: "5", isLike: false, likeCount: 2),
    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(PostCell.nib, forCellReuseIdentifier: "Cell")
        
        tableView.rx
            .modelSelected(Post.self)
            .subscribe(onNext: { [unowned self] post in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "AViewController")
                (vc as? AViewController)?.post.accept(post)
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: rx.disposeBag)
        
        posts
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: PostCell.self)) { _, item, cell in
                cell.set(post: item)
            }
            .disposed(by: rx.disposeBag)
        
        Change
            .bind(to: posts)
            .disposed(by: rx.disposeBag)
    }

}
