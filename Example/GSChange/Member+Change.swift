//
//  Member+Change.swift
//  GSChange_Example
//
//  Created by Gesen on 2019/6/14.
//  Copyright © 2019 Gesen. All rights reserved.
//

import GSChange

extension Member: ChangeItem {
    
    func changed(action: Change.Action, id: String?, userInfo: Any?) -> Member {
        
        var change = self
        
        change.posts = posts?.map { $0.changed(action: action, id: id, userInfo: userInfo) }
        
        return change
    }
    
}
