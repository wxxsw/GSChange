//
//  Post+Change.swift
//  GSChange_Example
//
//  Created by Gesen on 2019/6/14.
//  Copyright © 2019 Gesen. All rights reserved.
//

import GSChange

extension Post: ChangeItem {
    
    func changed(action: Change.Action, id: String?, userInfo: [AnyHashable: Any]?) -> Post {

        var change = self
        
        switch action {
            
        case .like:
            if id == change.id, change.isLike != true {
                change.isLike = true
                change.likeCount = (change.likeCount ?? 0) + 1
            }
            
        case .unlike:
            if id == change.id, change.isLike != false {
                change.isLike = false
                change.likeCount = (change.likeCount ?? 0) - 1
            }
            
        default: break
        }
        
        return change
    }
    
}
