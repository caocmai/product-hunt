//
//  FeedViewController.swift
//  Product Hunt
//
//  Created by Cao Mai on 4/17/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    var posts: [Post] = [] {
        didSet {
            feedTableView.reloadData()
        }
    }
    var networkManager = NetworkManager()
    
    
    @IBOutlet weak var feedTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        feedTableView.dataSource = self
        feedTableView.delegate = self
        updateFeed()
    }
    
    func updateFeed() {
        // call our network manager's getPosts method to update our feed with posts
        networkManager.getPosts() { result in
            switch result {
            case let .success(posts):
              self.posts = posts
            case let .failure(error):
              print(error)
            }
        }
    }
    
    
}

// MARK: UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    /// Determines how many cells will be shown on the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    /// Creates and configures each cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue and return an available cell, instead of creating a new cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        
        let post = posts[indexPath.row]
        cell.post = post
        
        return cell
    }
}

// MARK: UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
    // Code to handle cell events goes here...
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // provide a fixed size
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        let post = posts[indexPath.row]
        // Get the storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        // Get the commentsView from the storyboard
//        guard let commentsView = storyboard.instantiateViewController(withIdentifier: "commentsView") as? CommentsViewController else {
//            return
//        }
        guard let commentsView = storyboard.instantiateViewController(withIdentifier: "commentsView") as? CommentsViewController else {
          return
        }
        // set the post id for the comments
        commentsView.postID = post.id
        navigationController?.pushViewController(commentsView, animated: true)
    }
    
}
