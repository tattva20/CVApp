//
//  ExperienceModel.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/26/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation

// MARK: - ExperienceModel class
// This class contains the Experience model used by the ExperienceViewModel to decode it's data from JSON.

struct Experience: Codable {
    let company, position, website, startDate, endDate, summary, highlights: String
}
