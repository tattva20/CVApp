//
//  ExperienceView.swift
//  CVApp2
//
//  Created by Octavio Rojas on 5/27/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import UIKit

// MARK: - ExperienceView class
// This class is the view for ExperienceViewController it uses SummaryViewModel to retrieve it's data and populate the view's objects with it.

class ExperienceViewCell: UITableViewCell {
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var highLightsTextView: UITextView!
    
}

class ExperienceView: UITableViewController {
    
    private let viewModel = ExperienceViewModel()
    var experiences: [Experience] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
        
    func configureViews() {
        let error: (Error) -> Void = { error in
            self.handleError(error)
        }
        
        let completion: ([Experience]) -> Void = { experiences in
            DispatchQueue.main.async { [ weak self ] in
                self?.experiences = experiences
                self?.tableView.reloadData()
            }
        }
        
        viewModel.setWithJSON(completion: completion, error: error, service: .workExperience)
        self.viewModel.dataFetchError = { error in
            self.handleError(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experiences.count
    }
    
    // Uses viewModel to fetch all data from services and populate cells.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! ExperienceViewCell
        
        cell.companyLabel.text = experiences[indexPath.row].company
        cell.positionLabel.text = experiences[indexPath.row].position
        cell.websiteLabel.text = experiences[indexPath.row].website
        cell.startDateLabel.text = experiences[indexPath.row].startDate
        cell.endDateLabel.text = experiences[indexPath.row].endDate
        cell.summaryTextView.text = experiences[indexPath.row].summary
        cell.highLightsTextView.text = experiences[indexPath.row].highlights
        
        return cell
    }
}


