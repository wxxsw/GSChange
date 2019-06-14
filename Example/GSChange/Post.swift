//
//  Post.swift
//  GSChange_Example
//
//  Created by Gesen on 2019/6/14.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation

struct Post: Codable, Equatable {
    
    let id: String?
    var isLike: Bool?
    var likeCount: Int?
    
}
