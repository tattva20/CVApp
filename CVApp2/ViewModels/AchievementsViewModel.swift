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
    
    func setWithJSON(completion: @escaping (Achievements) -> Void, error: @escaping (Error) -> Void) {
        QueryAPI.shared.setServiceURL(service: .achievements)
        QueryAPI.shared.fetchData(failure: { failure in
            error(failure)
        }, completion: { data in
            do {
                let parsedJSON = try JSONDecoder().decode(Achievements.self, from: data)
                completion(parsedJSON)
            } catch {
                print(error)
            }
            return 
        })
    }
}
