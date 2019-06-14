//
//  GSChange.swift
//  GSChange
//
//  Created by Gesen on 2019/6/14.
//  Copyright (c) 2019 Gesen. All rights reserved.
//

import RxCocoa
import RxSwift

public enum GSChange {
    
    public struct Action: RawRepresentable, Equatable {
        public var rawValue: String
        public init(rawValue: String) { self.rawValue = rawValue }
    }
    
    static var notification: Observable<GSChangeUserInfo> {
        return NotificationCenter.default.rx
            .notification(.GSChange)
            .map { GSChangeUserInfo(rawValue: $0.userInfo ?? [:]) }
            .filter { $0 != nil }
            .map { $0! }
    }
    
    public static func perform(action: Action, id: String?, userInfo: Any? = nil) {
        NotificationCenter.default.post(
            name: .GSChange,
            object: nil,
            userInfo: GSChangeUserInfo(action: action, id: id, userInfo: userInfo).rawValue
        )
    }
    
    public static func observe<Item: GSChangeItem>(for item: BehaviorRelay<Item?>) -> Observable<Item?> {
        return notification
            .observeOn(SerialDispatchQueueScheduler(qos: .default))
            .map { [weak item] info in item?.value?.changed(action: info.action, id: info.id, userInfo: info.userInfo) }
            .filter { [weak item] in item?.value != $0 }
            .observeOn(MainScheduler.instance)
    }
    
    public static func observe<Item: GSChangeItem>(for items: BehaviorRelay<[Item]>) -> Observable<[Item]> {
        return notification
            .observeOn(SerialDispatchQueueScheduler(qos: .default))
            .map { [weak items] info in items?.value.map { $0.changed(action: info.action, id: info.id, userInfo: info.userInfo) } ?? [] }
            .filter { [weak items] in items?.value != $0 }
            .observeOn(MainScheduler.instance)
    }
    
    public static func bind<Item: GSChangeItem>(to item: BehaviorRelay<Item?>) -> Disposable {
        return observe(for: item).bind(to: item)
    }
    
    public static func bind<Item: GSChangeItem>(to items: BehaviorRelay<[Item]>) -> Disposable {
        return observe(for: items).bind(to: items)
    }
    
}
