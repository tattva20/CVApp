//
//  TableViewModelProtocol.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/29/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation

protocol TableViewModelProtocol {
    
    func setWithJSON(completion: @escaping ([Experience]) -> Void, error: @escaping (Error) -> Void, service: Services)
}
