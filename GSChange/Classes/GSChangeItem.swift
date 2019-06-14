//
//  GSChangeItem.swift
//  GSChange
//
//  Created by Gesen on 2019/6/14.
//  Copyright (c) 2019 Gesen. All rights reserved.
//

public protocol GSChangeItem: Equatable {
    
    func changed(action: GSChange.Action, id: String?, userInfo: Any?) -> Self
    
}
