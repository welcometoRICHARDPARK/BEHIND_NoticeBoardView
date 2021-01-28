//
//  commentModel.swift
//  Behind
//
//  Created by 박대희 on 2020/09/20.
//  Copyright © 2020 Yourssu. All rights reserved.
//

import Foundation

class CommentModel : Codable {
    // codable에서는 하나라도 값 선언이 잘 못 할당 되면 전체적으로 값이 할당이 안될수 있다
    var commentId : Int?
    var postOwner : Bool?
    var content : String?
    var createdAt : [Int]?
    var isDeleted : Bool?
    var reComment : [CommentModel]?
    var subCommentIs : Bool?
    
}

