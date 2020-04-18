//
//  FeedViewController.swift
//  Product Hunt
//
//  Created by Cao Mai on 4/17/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    
    @IBOutlet weak var feedTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        feedTableView.dataSource = self
        feedTableView.delegate = self
    }


}

// MARK: UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
   /// Determines how many cells will be shown on the table view.
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 3
   }

   /// Creates and configures each cell.
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       return UITableViewCell()
  }
}

// MARK: UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
  // Code to handle cell events goes here...
}
