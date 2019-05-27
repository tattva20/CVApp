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
    
    func setWithJSON(completion: @escaping (Skills) -> Void, error: @escaping (Error) -> Void) {
        QueryAPI.shared.setServiceURL(service: .skills)
        QueryAPI.shared.fetchData(failure: { failure in 
            error(failure)
        }, completion: { data in
            do {
                let parsedJSON = try JSONDecoder().decode(Skills.self, from: data)
                completion(parsedJSON)
            } catch {
                print(error)
            }
            return
        })
    }
}
