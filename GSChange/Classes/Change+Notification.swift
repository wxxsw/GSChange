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

public struct ChangeUserInfo: RawRepresentable {
    
    public let action: Change.Action
    public let id: String?
    public let userInfo: [AnyHashable: Any]?
    
    public var rawValue: [AnyHashable: Any] {
        var value: [AnyHashable: Any] = [actionKey: action]
        if let id = id { value[idKey] = id }
        if let userInfo = userInfo { value[userInfoKey] = userInfo }
        return value
    }
    
    init(action: Change.Action, id: String?, userInfo: [AnyHashable: Any]?) {
        self.action = action
        self.id = id
        self.userInfo = userInfo
    }
    
    public init?(rawValue: [AnyHashable : Any]) {
        guard
            let action = rawValue[actionKey] as? Change.Action
            else { return nil }
        
        self.action = action
        self.id = rawValue[idKey] as? String
        self.userInfo = rawValue[userInfoKey] as? [AnyHashable : Any]
    }
    
}

private let actionKey = "action"
private let idKey = "id"
private let userInfoKey = "userInfo"
