//
//  TableViewModelProtocol.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/28/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation

protocol TableViewModelProtocol {
    
    var tableArray: [Experience] { get set }
    
    var dataFetchError : ((Error) -> Void)? { get }
    
    func setWithJSON<T: Decodable>(completion: @escaping (T) -> Void, error: @escaping (Error) -> Void, service: Services)
}

extension TableViewModelProtocol {
}
