//
//  ViewModelProtocol.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/28/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation

protocol ViewModelProtocol {
    
    var dataFetchError : ((Error) -> Void)? { get }
    
    func setWithJSON<T: Codable>(completion: @escaping (T) -> Void, error: @escaping (Error) -> Void, service: Services)  
}

extension ViewModelProtocol {
    func setWithJSON<T>(completion: @escaping (T) -> Void, error: @escaping (Error) -> Void, service: Services) where T : Decodable {
        let failure: (Error) -> Void = { error in
            self.dataFetchError?(error)
        }
        
        let completion: (Data) -> Void = { data in
            
            do {
                let parsedJSON = try JSONDecoder().decode(T.self, from: data)
                completion(parsedJSON)
            } catch {
                self.dataFetchError?(error)
            }
            return
        }
        
        QueryAPI.shared.setServiceURL(service)
        QueryAPI.shared.fetchData(failure: failure, completion: completion)
    }
}
