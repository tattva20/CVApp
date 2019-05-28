//
//  AchievementsViewModel.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/27/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation

// MARK: - AchievementsViewModel class
// This class is the viewModel for the AchievementsView it uses queryAPI to fetch the data, then it converts the data to JSON and returns it to the view in a closure.

class AchievementsViewModel {
    
    var dataFetchError : ((Error) -> Void)?
    
    func setWithJSON(completion: @escaping (Achievements) -> Void, error: @escaping (Error) -> Void)  {
        
        let failure: (Error) -> Void = { error in
            self.dataFetchError?(error)
        }
        
        let completion: (Data) -> Void = { data in
            
            do {
                let parsedJSON = try JSONDecoder().decode(Achievements.self, from: data)
                completion(parsedJSON)
            } catch {
                self.dataFetchError?(error)
            }
            return
        }
        
        QueryAPI.shared.setServiceURL(.achievements)
        QueryAPI.shared.fetchData(failure: failure, completion: completion)
    }
}
