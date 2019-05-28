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

class ExperienceViewModel: ViewModelProtocol {
    var dataFetchError : ((Error) -> Void)?
    
}
