//
//  UserDataManager.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 29.09.25.
//

import Foundation

class UserDataManager {
    enum UserDefaultsType: String, CaseIterable {
        case email
        case username
        case isLoggedIn
    }
    
    func saveData(value: Any, key: UserDefaultsType) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    func getString(key: UserDefaultsType) -> String? {
        UserDefaults.standard.string(forKey: key.rawValue)
    }
    func getBool(key: UserDefaultsType) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    func removeAllData() {
        for key in UserDefaultsType.allCases {
            UserDefaults.standard.removeObject(forKey: key.rawValue)
        }
    }
}
