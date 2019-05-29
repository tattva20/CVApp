//
//  ExperienceViewModel.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/27/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation

// MARK: - ExperienceViewModel class
// This class is the viewModel for the ExperienceView it uses queryAPI to fetch the data, then it converts the data to JSON and returns it to the view in a closure.

class ExperienceViewModel {
    var dataFetchError : ((Error) -> Void)?
    
    func setWithJSON(completion: @escaping ([Experience]) -> Void, error: @escaping (Error) -> Void, service: Services) {
        let failure: (Error) -> Void = { error in
            self.dataFetchError?(error)
        }
        
        let completion: (Data) -> Void = { data in
            
            do {
                let parsedJSON = try JSONDecoder().decode([Experience].self, from: data)
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
