//
//  event.swift
//  test01
//
//  Created by yasudaakiho on 2020/07/10.
//  Copyright © 2020 yasudaakiho. All rights reserved.
//

import Foundation
import RealmSwift

class Event: Object {

    @objc dynamic var date: String = ""
    @objc dynamic var event: String = ""

}
