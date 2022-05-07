//
//  UserHelper.swift
//  ELearning
//
//  Created by Mansi Prajapati on 01/06/22.
//
//

import Foundation

/// propertyWrapper for userDefaults
@propertyWrapper
class UserDefault<T> {
    let userDefaults = UserDefaults.standard
    var key: String
    let defaultValue: T
       var wrappedValue: T {
           get {
               return userDefaults.object(forKey: key) as? T ?? defaultValue
           }
           set (notFirst){
               userDefaults.set(notFirst, forKey: key)
           }
       }
    
    init(key: String, defaultValue: T) {
           self.key = key
           self.defaultValue = defaultValue
       }
}

enum keys: String {
    case notFirst = "notFirst"
    case isLoggedIn = "Logged"
}

class UserHelper {
    static var shared = UserHelper()
    @UserDefault(key: keys.notFirst.rawValue, defaultValue: false)
    var notFirst: Bool
    
    @UserDefault(key: keys.isLoggedIn.rawValue, defaultValue: false)
    var isLoggedIn: Bool
}
let userHelper = UserHelper.shared
