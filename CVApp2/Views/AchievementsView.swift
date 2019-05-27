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
        viewModel.setWithJSON(completion: { achievements in
            DispatchQueue.main.async {
                self.achievementsTextView.text = achievements.achievements
            }
        }, error: { failure in
            let alert = UIAlertController(title: "Error", message: failure.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
}
