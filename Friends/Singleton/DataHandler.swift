//
//  DataHandler.swift
//  Friends
//
//  Created by Amit Sarker on 6/19/21.
//

import Foundation
import UIKit

//MARK: This class is rsponsible for getting and preparing data from API
class DataHandler {
    static let shared = DataHandler()
    
    func getPersonalData(completionHandler: @escaping (_ data: PersonalInfo?, _ isInterNet: Bool) -> ()){
        
        //Creating URL Session
        if let url = URL(string: Constant.urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    let Error = error! as NSError
                    if Error.code == NSURLErrorNotConnectedToInternet {
                        completionHandler(nil, false)
                    }
                    else {
                        completionHandler(nil, true)
                    }
                }
                else {
                    if let safeData = data {
                        let decoader = JSONDecoder()
                        do {
                            let decoadableData = try decoader.decode(JsonData.self, from: safeData)
                            
                            //Recived JSON data
                            if let imageUrl = URL(string: decoadableData.results [ 0 ].picture.large){
                                
                                //Requesting for Image from URL
                                URLSession.shared.dataTask(with: imageUrl) { image, response, error in
                                    if ( error != nil ){
                                        let Error = error! as NSError
                                        if Error.code == NSURLErrorNotConnectedToInternet {
                                            completionHandler(nil, false)
                                        }
                                        else {
                                            completionHandler(nil, true)
                                        }
                                    }
                                    else {
                                        //If successfully recived the image, returning
                                        if let Image = UIImage(data: image! ){
                                            let name = decoadableData.results [ 0 ].name.title + " " + decoadableData.results [ 0 ].name.first + " " + decoadableData.results [ 0 ].name.last
                                            let address = String(decoadableData.results [ 0 ].location.street.number) + ", " + decoadableData.results [ 0 ].location.street.name
                                            let city = decoadableData.results [ 0 ].location.city
                                            let state = decoadableData.results [ 0 ].location.state
                                            let county = decoadableData.results [ 0 ].location.country
                                            let email = decoadableData.results [ 0 ].email
                                            let phone = decoadableData.results [ 0 ].phone
                                            let dataToPass = PersonalInfo(image: Image, fullName: name, address: address, city: city, state: state, country: county, email: email, cellNumber: phone)
                                            completionHandler(dataToPass, true)
                                        }
                                        else {
                                            completionHandler(nil, true)
                                        }
                                    }
                                }.resume()
                            }
                        }catch {
                            completionHandler(nil, true)
                        }
                    }
                }
                
            }
            task.resume()
        }
        else {
            completionHandler(nil, true)
        }
    }
    
}



