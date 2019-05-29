//
//  SkillsModel.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/26/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation

// MARK: - SkillsModel class
// This class contains the Skills model used by the SkillsViewModel to decode it's data from JSON.

struct Skills: Codable {
    
    let skills: String
    
}
