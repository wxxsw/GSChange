//
//  Change+Notification.swift
//  GSChange
//
//  Created by Gesen on 2019/6/14.
//  Copyright (c) 2019 Gesen. All rights reserved.
//

extension Notification.Name {
    
    static let GSChange = Notification.Name("me.gesen.Change")
    
}

struct ChangeUserInfo: RawRepresentable {
    
    let action: Change.Action
    let id: String?
    let userInfo: Any?
    
    var rawValue: [AnyHashable: Any] {
        var value: [AnyHashable: Any] = [actionKey: action]
        if let id = id { value[idKey] = id }
        if let userInfo = userInfo { value[userInfoKey] = userInfo }
        return value
    }
    
    init(action: Change.Action, id: String?, userInfo: Any?) {
        self.action = action
        self.id = id
        self.userInfo = userInfo
    }
    
    init?(rawValue: [AnyHashable : Any]) {
        guard
            let action = rawValue[actionKey] as? Change.Action,
            let id = rawValue[idKey] as? String
            else { return nil }
        
        self.action = action
        self.id = id
        self.userInfo = rawValue[userInfoKey]
    }
    
}

private let actionKey = "action"
private let idKey = "id"
private let userInfoKey = "userInfo"
