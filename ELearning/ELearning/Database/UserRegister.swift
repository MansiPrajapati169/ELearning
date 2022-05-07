//
//  UserRegister.swift
//  ELearning
//
//  Created by Mansi Prajapati on 16/06/22.
//

import Foundation
import RealmSwift

class UserRegister: Object {
    @Persisted var name = ""
    @Persisted(primaryKey: true) var email = ""
    @Persisted var password = ""
}
  
class UserRegisterDAO {
    var realm: Realm = try! Realm()
      
    func saveUser(_ emp: UserRegister, _ completion: @escaping(Bool) -> Void) {
        try? realm.write {
            let existingPerson = realm.object(ofType: UserRegister.self, forPrimaryKey: emp.email)
            
            if existingPerson != nil {
                realm.add(emp,update: .all)
                completion(false)
            } else {
                realm.add(emp)
                completion(true)
            }
        }
    }
    
    public func findUser(_ email: String, _ pwd: String) -> Results<UserRegister> {
        let predicate = NSPredicate(format: "email = %@ AND password = %@", email, pwd)
        return realm.objects(UserRegister.self).filter(predicate)
    }
    
    public func getAllUsers() -> Results<UserRegister> {
        let users = realm.objects(UserRegister.self)
        return users
    }
    
    public func addNewUser( _ name: String, _ email: String, _ password: String ) -> UserRegister {
        let user = UserRegister()
        user.name = name
        user.email = email
        user.password = password
        return user
    }
    
    public func deleteUser(_ email: String, _ completion: @escaping(Bool) -> Void) {
        if let existingPerson = realm.object(ofType: UserRegister.self, forPrimaryKey: email) {
            try? realm.write {
                realm.delete(existingPerson)
                completion(true)
            }
        } else {
            completion(false)
        }
    }
}
