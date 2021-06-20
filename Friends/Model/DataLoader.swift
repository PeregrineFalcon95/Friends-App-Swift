//
//  DataLoader.swift
//  Friends
//
//  Created by Amit Sarker on 6/19/21.
//

import Foundation

protocol dataLoaderDelegate : NSObjectProtocol {
    func errorUpdatingData(idx: Int)
    func newDataUpdated()
}

class DataLoader{
    static let shared = DataLoader()
    var person : [ PersonalInfo ] = []
    weak var delegate : dataLoaderDelegate?
    
    //Fetching data and notifying viewController
    func fetchData(){
        for num in 0..<10{
            DataHandler.shared.getPersonalData { info in
                guard let result = info else {
                    if let delegate = self.delegate {
                        delegate.errorUpdatingData(idx: num)
                    }
                    return
                }
                self.person.append(result)
                if let delegate = self.delegate {
                    delegate.newDataUpdated()
                }
            }
        }
    }
}
