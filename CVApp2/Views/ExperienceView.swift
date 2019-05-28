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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    // Uses viewModel to fetch all data from services and populate cells.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! ExperienceViewCell
        
        do {
            try viewModel.setWithJSON(completion: { experiences in
                DispatchQueue.main.sync { [ weak cell ] in 
                    cell?.companyLabel.text = experiences[indexPath.row].company
                    cell?.positionLabel.text = experiences[indexPath.row].position
                    cell?.websiteLabel.text = experiences[indexPath.row].website
                    cell?.startDateLabel.text = experiences[indexPath.row].startDate
                    cell?.endDateLabel.text = experiences[indexPath.row].endDate
                    cell?.summaryTextView.text = experiences[indexPath.row].summary
                    cell?.highLightsTextView.text = experiences[indexPath.row].highlights
                }
            }, error: { failure in
                self.handleError(error: failure)
            })
        } catch {
            self.handleError(error: error)
        }
        return cell
    }
}


