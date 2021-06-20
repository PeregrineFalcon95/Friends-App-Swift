//
//  PersonalInfo.swift
//  Friends
//
//  Created by Amit Sarker on 6/19/21.
//

import Foundation
import UIKit

struct PersonalInfo {
    var image : UIImage
    var fullName : String
    var address : String
    var city : String
    var state : String
    var country : String
    var email : String
    var cellNumber : String
    
    init(image : UIImage, fullName : String, address : String, city : String, state : String, country : String, email : String, cellNumber : String) {
        self.image      = image
        self.fullName   = fullName
        self.address    = address
        self.city       = city
        self.state      = state
        self.country    = country
        self.email      = email
        self.cellNumber = cellNumber
    }
}
