//
//  SummaryView.swift 
//  CVApp2
//
//  Created by Octavio Rojas on 5/26/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import UIKit

// MARK: - SummaryView class
// This class is the view for SummaryViewController it uses SummaryViewModel to retrieve it's data and populate the view's objects with it.

class SummaryView: UIViewController {

    private let viewModel = SummaryViewModel()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillTextLabelsAndViews()
    }
        
    // Uses viewModel to fetch all data from services and populate view's objects
    func fillTextLabelsAndViews() {
        
        let error: (Error) -> Void = { error in
            self.handleError(error)
        }
        
        let completion: (Person) -> Void = { person in
            DispatchQueue.main.async { [ weak self ] in
                self?.nameLabel.text = person.name
                self?.lastNameLabel.text = person.lastName
                self?.emailLabel.text = person.email
                self?.phoneLabel.text = person.phone
                self?.degreeLabel.text = person.degree
                self?.summaryTextView.text = person.summary
            }
        }
        
        do {
            try viewModel.setWithJSON(completion: completion, error: error)
            self.viewModel.dataFetchError = { error in
                self.handleError(error)
            }
        }
            
        catch { self.handleError(error) }
    }
}

