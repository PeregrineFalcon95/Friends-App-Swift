//
//  DataLoader.swift
//  Friends
//
//  Created by Amit Sarker on 6/19/21.
//

import Foundation

protocol dataLoaderDelegate : NSObjectProtocol {
    func noConnectedToInternet()
    func newDataUpdated()
}

class DataLoader{
    static let shared = DataLoader()
    var person : [ PersonalInfo ] = []
    weak var delegate : dataLoaderDelegate?
    var isInternet = true
    
    
    //Fetching data and notifying viewController
    //Will continue calling for Data until it complete 10 persons data. Will stop requesting if not internet error encountered.
    func getData(){
        DataHandler.shared.getPersonalData { info, isInternet  in
            
            if isInternet == false {
                self.isInternet = false
                if let Delegate = self.delegate {
                    Delegate.noConnectedToInternet()
                }
            }
            else if isInternet == true{
                guard let result = info else {
                    self.getData()
                    return
                }
                self.person.append(result)
                if let delegate = self.delegate {
                    delegate.newDataUpdated()
                }
                if self.person.count < 10 {
                    self.getData()
                }
            }
        }
    }
}
