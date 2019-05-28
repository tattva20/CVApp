//
//  SkillsViewModel.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/27/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation

// MARK: - SkillsViewModel class
// This class is the viewModel for the SkillsView it uses queryAPI to the fetch data, then it converts the data to JSON and returns it to the view in a closure.

class SkillsViewModel {
    
    var dataFetchError : ((Error) -> Void)?
    
    func setWithJSON(completion: @escaping (Skills) -> Void, error: @escaping (Error) -> Void) throws {
        
        let failure: (Error) -> Void = { error in
            self.dataFetchError?(error)
        }
        
        let completion: (Data) -> Void = { data in
            
            do {
                let parsedJSON = try JSONDecoder().decode(Skills.self, from: data)
                completion(parsedJSON)
            } catch {
                self.dataFetchError?(error)
            }
            return
        }
        
        QueryAPI.shared.setServiceURL(.skills)
        do { try QueryAPI.shared.fetchData(failure: failure, completion: completion) }
        catch { self.dataFetchError?(error) }
    }
}
