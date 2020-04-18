//
//  CommentsViewController.swift
//  Product Hunt
//
//  Created by Cao Mai on 4/17/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var commentsTableView: UITableView!
    
    
    var comments: [Comment] = [] {
        didSet {
            commentsTableView.reloadData()
        }
    }

     var postID: Int!

     var networkManager = NetworkManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTableView.dataSource = self
        commentsTableView.delegate = self
        updateComments()

        // Do any additional setup after loading the view.
    }
    
    func updateComments() {
       // Similar to what we did for posts
       networkManager.getComments(postID) { result in
           switch result {
           case let .success(comments):
             self.comments = comments
           case let .failure(error):
             print(error)
           }
       }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


// MARK: UITableViewDatasource
extension CommentsViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return comments.count
 }

 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell

   let comment = comments[indexPath.row]
   cell.commentTextView.text = comment.body
   return cell
 }
}

// MARK: UITableViewDelegate
extension CommentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
