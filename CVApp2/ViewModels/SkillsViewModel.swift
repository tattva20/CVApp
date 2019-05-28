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

struct SkillsViewModel: ViewModelProtocol {
    var dataFetchError : ((Error) -> Void)?
    
}
