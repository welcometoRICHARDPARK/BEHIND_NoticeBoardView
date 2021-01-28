//
//  comment.swift
//  Behind
//
//  Created by 박대희 on 2020/09/13.
//  Copyright © 2020 Yourssu. All rights reserved.
//

import Foundation
import UIKit

struct CreateOrUpdateRequestPostDto :Encodable{
    var createOrUpdateRequestPostDto : CommentVO
}
struct CommentVO : Encodable{
    var title : String
    var content : String
    var lectureId : String
    var type : String
}

class Comment:Codable {
    var title : String?
    var memo : String?
    var lectureId : String?
    var type : String?
    
    //Optional Dictionary 타입을 리턴할거에요 -> 리턴값이 Optional(Dic) or nil
    func toJSON2() -> [String: Any]?{
        
        return [
            "createOrUpdateRequestPostDto":
            [
                "title":"title",
                "memo":"hello world",
                "lectureId":"1",
                "type":"FREE"
            ]

        ]
    }
    
    func toJSON() -> [String:String]?{
        guard let title = title, let lectureId = lectureId, let type = type else { return nil }
        // title 과 lectureId 그리고 type이 nil이 아니면
        // nil 이 아니면 밑에 return문을 실행 하게 된다
        return ["title" : title,
                "memo" : memo ?? "",
                // memo가 아무것도 없으면 빈것을 즉 ""을 저장해서 내보낸다
                "lectureId" : lectureId,
                "type" : type
        ]
        
    }
}
