//
//  ViewProtocol
//  CVApp2
//
//  Created by Octavio Rojas on 5/28/19.
//  Copyright © 2019 Octavio Rojas. All rights reserved.
//

import Foundation
import UIKit

protocol ViewProtocol {
    
    func handleError(_ error: Error)
    
}

extension UIViewController: ViewProtocol {
    
    internal func handleError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
