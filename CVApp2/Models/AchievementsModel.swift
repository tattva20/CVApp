//
//  AchievementsModel.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/26/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation

// MARK: - AchievementsModel class
// This class contains the Achievements model used by the AchievementsViewModel to decode it's data from JSON.

struct Achievements: Codable {
    let achievements: String
}
