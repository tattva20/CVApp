//
//  SummaryViewModel.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/26/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation

// MARK: - SummaryViewModel class
// This class is the viewModel for the SummaryView it uses queryAPI to fetch the data, then it converts the data to JSON and returns it to the view in a closure.

struct SummaryViewModel: ViewModelProtocol {
    var dataFetchError : ((Error) -> Void)?
}
