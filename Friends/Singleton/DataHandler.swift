//
//  DataHandler.swift
//  Friends
//
//  Created by Amit Sarker on 6/19/21.
//

import Foundation
import UIKit

class DataHandler {
    static let shared = DataHandler()
    let url = "https://randomuser.me/api/"
    
    func getPersonalData(completionHandler: @escaping (_ data: PersonalInfo?) -> ()){
        let data = PersonalInfo(image: UIImage(named: "")!, fullName: "", address: "", city: "", state: "", country: "", email: "", cellNumber: "")
        
        
        
        
        
        completionHandler( data )
    }
}

struct response : Codable {
    
}

struct myResult : Codable {
    
}

struct name: Codable {
    
}
/*
 {
    "results":[
       {
          "gender":"female",
          "name":{
             "title":"Miss",
             "first":"Yasemin",
             "last":"Karaduman"
          },
          "location":{
             "street":{
                "number":7005,
                "name":"Abanoz Sk"
             },
             "city":"Muş",
             "state":"Ankara",
             "country":"Turkey",
             "postcode":82565,
             "coordinates":{
                "latitude":"70.7238",
                "longitude":"51.7542"
             },
             "timezone":{
                "offset":"+11:00",
                "description":"Magadan, Solomon Islands, New Caledonia"
             }
          },
          "email":"yasemin.karaduman@example.com",
          "login":{
             "uuid":"f73fb691-ce5d-4446-a107-dc2fc26b44d1",
             "username":"heavyswan823",
             "password":"1515",
             "salt":"4vYrszle",
             "md5":"594efe44081c0a2f4a4e28db7b936781",
             "sha1":"b02ea51c6005133ed007ffda64b47c743304e724",
             "sha256":"17c903e2fcb527d37287603d84eb3b414441924c691b52ed593cfda53ecea3a0"
          },
          "dob":{
             "date":"1952-02-25T23:08:40.049Z",
             "age":69
          },
          "registered":{
             "date":"2018-10-10T00:00:08.751Z",
             "age":3
          },
          "phone":"(147)-228-1150",
          "cell":"(828)-154-5629",
          "id":{
             "name":"",
             "value":null
          },
          "picture":{
             "large":"https://randomuser.me/api/portraits/women/78.jpg",
             "medium":"https://randomuser.me/api/portraits/med/women/78.jpg",
             "thumbnail":"https://randomuser.me/api/portraits/thumb/women/78.jpg"
          },
          "nat":"TR"
       }
    ],
    "info":{
       "seed":"8ebb43518da1a936",
       "results":1,
       "page":1,
       "version":"1.3"
    }
 }
 */
