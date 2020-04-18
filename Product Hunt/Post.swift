//
//  Post.swift
//  Product Hunt
//
//  Created by Cao Mai on 4/17/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import Foundation

/// A product retrieved from the Product Hunt API.
struct Post {
   // Various properties of a post that we either need or want to display
   let id: Int
   let name: String
   let tagline: String
   let votesCount: Int
   let commentsCount: Int
}
