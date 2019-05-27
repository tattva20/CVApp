//
//  PersonModel.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/26/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation

// MARK: - PersonModel class
// This class contains the Person model used by the SummaryViewModel to decode it's data from JSON.

struct Person: Codable {
    let name, lastName, email, phone, degree, summary: String
}
