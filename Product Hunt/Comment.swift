//
//  Comment.swift
//  Product Hunt
//
//  Created by Cao Mai on 4/17/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import Foundation

struct Comment: Decodable {
 let id: Int
 let body: String
}

struct CommentApiResponse: Decodable {
   let comments: [Comment]
}
