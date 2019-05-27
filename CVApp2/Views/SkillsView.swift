//
//  SkillsView.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/27/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import UIKit

// MARK: - SkillsView
// This class is the view for SkillsViewController it uses SummaryViewModel to retrieve it's data and populate the view's objects with it.

class SkillsView: UIViewController {
    
    private let viewModel = SkillsViewModel()
    
    @IBOutlet weak var skillsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillTextLabelsAndViews()
    }
    
    // Uses viewModel to fetch all data from services and populate view's objects
    fileprivate func fillTextLabelsAndViews() {
        viewModel.setWithJSON(completion: { skills in
            DispatchQueue.main.async {
                self.skillsTextView.text = skills.skills
            }
        }, error: { failure in
            let alert = UIAlertController(title: "Error", message: failure.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
}