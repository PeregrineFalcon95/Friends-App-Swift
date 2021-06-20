//
//  JsonDataModel.swift
//  Friends
//
//  Created by Amit Sarker on 6/20/21.
//

import Foundation

//MARK: For Jason data Format
struct JsonData : Decodable {
    let results : [Results]
}
struct Results : Decodable{
    let name : Name
    let location : Location
    let email : String
    let phone : String
    let picture : Picture
}

struct Name : Decodable {
    let title: String
    let first: String
    let last: String
}
struct Location : Decodable {
    let street : Street
    let city : String
    let state : String
    let country : String
}
struct Street : Decodable {
    let number : Int
    let name : String
}
struct Picture : Decodable {
    let large : String
    let medium : String
}
