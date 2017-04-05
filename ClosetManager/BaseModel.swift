//
//  BaseModel.swift
//  ClosetManager
//
//  Created by Aniruddha Borah on 2017-04-05.
//  Copyright © 2017 impy. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class BaseModel: Object {
    dynamic var identifier: String?
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
}

