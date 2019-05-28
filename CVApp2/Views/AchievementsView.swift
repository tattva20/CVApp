//
//  AchievementsView.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/27/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import UIKit

// MARK: - AchievementsView class
// This class is the view for AchievmentsViewController it uses SummaryViewModel to retrieve it's data and populate the view's objects with it.

class AchievementsView: UIViewController {
    
    private let viewModel = AchievementsViewModel()
    
    @IBOutlet weak var achievementsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillTextLabelsAndViews()
    }
    
    // Uses viewModel to fetch all data from services and populate view's objects
    fileprivate func fillTextLabelsAndViews() {
        
        let error: (Error) -> Void = { error in
            self.handleError(error)
        }
        
        let completion: (Achievements) -> Void = { achievements in
            DispatchQueue.main.async { [ weak self ] in
                self?.achievementsTextView.text = achievements.achievements
            }
        }
        
        viewModel.setWithJSON(completion: completion, error: error, service: .achievements)
        self.viewModel.dataFetchError = { error in
            
            self.handleError(error)
        }
    }
}
