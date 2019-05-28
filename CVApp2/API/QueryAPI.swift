//
//  QueryAPI.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/26/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation

// MARK: - ServiceEndPoints
private struct Endpoints {
    let summary = "SummaryURL"
    let workExperience = "ExperienceURL"
    let skillsEndpoint = "SkillsURL"
    let achievementsEndpoint = "AchievementsURL"
}

// MARK: - Servicestypes
public enum Services {
    case summary
    case workExperience
    case skills
    case achievements
}

// MARK: - QueryAPI class
// This singleton will fetch the data from the desired services endPoint and return it as a closure for the viewModels.

final class QueryAPI {
    
    // MARK: - Attributes
    private var plist: [AnyHashable: Any]?
    
    // MARK: - Singleton stuff
    static let shared = QueryAPI()
    
    private init () {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            self.plist = NSDictionary(contentsOfFile: path) as? [AnyHashable: Any]
        }
    }
    
    var dataTask: URLSessionDataTask?
    private(set)var endPoint: URL?
    
    
    // Sets the correct url for the desired service
    func setServiceURL(_ service: Services) {

        switch service {
        case .summary:
            guard let string = self.plist?[Endpoints().summary] as? String,
                let url = URL(string: string) else {
                return
            }
            endPoint = url
        case .workExperience:
            guard let string = self.plist?[Endpoints().workExperience] as? String,
                  let url = URL(string: string) else {
                return
            }
            endPoint = url
        case .skills:
            guard let string = self.plist?[Endpoints().skillsEndpoint] as? String,
                let url = URL(string: string) else {
                    return
            }
            endPoint = url
        case .achievements:
            guard let string = self.plist?[Endpoints().achievementsEndpoint] as? String,
                let url = URL(string: string) else {
                    return
            }
            endPoint = url
        }
    }
    
    // Fetches data for viewmodels and returns it as a closure
    func fetchData(failure: @escaping (Error) -> (), completion: @escaping (Data) -> ()) throws {
        
        guard let url = self.endPoint else {
            return
        }
        
        let completionHandler: (Data?, URLResponse?, Error?) -> () = { data, response, error in
            guard error == nil,
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                    guard let error = error else {
                        return
                    }
                    failure(error)
                    return
            }
            completion(data)
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: completionHandler)
        task.resume()
    }
}


