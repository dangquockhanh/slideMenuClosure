//
//  User.swift
//  slideMenu4
//
//  Created by Đặng Khánh  on 4/25/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import Foundation

class User {
    var avatar: Data?
    var name: String?
    var age: String?
    init(avatar: Data, name:String, age:String) {
        self.avatar = avatar
        self.name = name
        self.age = age
    }
}
