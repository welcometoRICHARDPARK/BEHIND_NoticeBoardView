//
//  detailViewCommentContents.swift
//  Behind
//
//  Created by 박대희 on 2020/09/13.
//  Copyright © 2020 Yourssu. All rights reserved.
//

import Foundation

class DetailComment {
    var content : String?
    var anonymous: Bool?
    var date: String?
    
    var isParent : Bool
    
    init(isParent : Bool) {
        self.isParent = isParent
    }
}
