//
//  Realm.swift
//  ClosetManager
//
//  Created by Aniruddha Borah on 2017-04-05.
//  Copyright © 2017 impy. All rights reserved.
//

import UIKit
import RealmSwift

var executingRealmInstance: Realm?


extension Realm {
    
    static func execute(_ completion: (Realm) -> Void) {
        if let realm = executingRealmInstance {
            completion(realm)
            return
        }
        
        guard let realm = try? Realm() else { return }
        executingRealmInstance = realm
        try? realm.write {
            completion(realm)
        }
        executingRealmInstance = nil
    }
    
    static func getOrCreate<T: BaseModel>(_ model: T.Type, primaryKey: String) -> T {
        var object: T!
        
        self.execute { (realm) in
            object = realm.object(ofType: model, forPrimaryKey: primaryKey as AnyObject)
            
            if object == nil {
                object = T()
            }
        }
        
        return object
    }
    
    // MARK: Mutate
    
    // This method will add or update a Realm's object.
    static func delete(_ object: Object) {
        guard !object.isInvalidated else { return }
        
        self.execute { realm in
            realm.delete(object)
        }
    }
    
    // This method will add or update a Realm's object.
    static func update(_ object: Object) {
        self.execute { realm in
            realm.add(object, update: true)
        }
    }
    
    // This method will add or update a list of some Realm's object.
    static func update<S: Sequence>(_ objects: S) where S.Iterator.Element: Object {
        self.execute { realm in
            realm.add(objects, update: true)
        }
    }
    
}
