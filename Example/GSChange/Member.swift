//
//  Member.swift
//  GSChange_Example
//
//  Created by Gesen on 2019/6/14.
//  Copyright © 2019 Gesen. All rights reserved.
//

import Foundation

struct Member: Codable, Equatable {
    
    let id: String?
    let name: String?
    var posts: [Post]?
    
}
