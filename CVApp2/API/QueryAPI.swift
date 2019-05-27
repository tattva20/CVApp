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
    let summaryEndpoint = "https://api.myjson.com/bins/1egodo"
    let workExperienceEndpoint = "https://api.myjson.com/bins/6gqrw"
    let skillsEndpoint = "https://api.myjson.com/bins/1bfd70"
    let achievementsEndpoint = "https://api.myjson.com/bins/r1tv4"
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

public class QueryAPI {
    
    static let shared = QueryAPI()
    
    private init () {
        
    }
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var data: Data?
    private(set)var endPoint: URL?
    
    
    // Sets the correct url for the desired service
    func setServiceURL(service: Services) {

        switch service {
        case .summary:
            guard let url = URL(string: Endpoints().summaryEndpoint) else {
                return
            }
            endPoint = url
        case .workExperience:
            guard let url = URL(string: Endpoints().workExperienceEndpoint) else {
                return
            }
            endPoint = url
        case .skills:
            guard let url = URL(string: Endpoints().skillsEndpoint) else {
                return
            }
            endPoint = url
        case .achievements:
            guard let url = URL(string: Endpoints().achievementsEndpoint) else {
                return
            }
            endPoint = url
        }
    }
    
    // Fetches data for viewmodels and returns it as a closure
    func fetchData(failure: @escaping (Error) -> (), completion: @escaping (Data) -> ()) {
        guard let url = self.endPoint else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
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
        })
        task.resume()
    }
}


