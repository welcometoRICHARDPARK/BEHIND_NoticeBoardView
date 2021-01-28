//
//  QuestionsTableViewCell.swift
//  BehindNoticeBoard
//
//  Created by 박대희 on 2020/08/09.
//  Copyright © 2020 richard. All rights reserved.
//

import UIKit

class QuestionsTableViewCell: UITableViewCell {

  

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var contentsView: UIView!
    
    @IBOutlet weak var QuestionNameLabel: UILabel!
    @IBOutlet weak var ContentsPreviewLabel: UILabel!
    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var SortOfContentsLabel: UILabel!
    @IBOutlet weak var ContentsUpDatesLabel: UILabel!
    @IBOutlet weak var CommentsImageVIew: UIImageView!
    @IBOutlet weak var NumberOfCommentsLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        label.text = "hi"
//        NumberOfCommentsLabel.text = "hi"
        // 제일 밑에 있는 label -> 그림자표현하기 위해서 만든것
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 0.5
        label.backgroundColor = UIColor.clear
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
        label.layer.shadowOpacity = 0.7
        label.layer.shadowRadius = 4.0
        label.frame = CGRect(x: 20, y: 11, width: 374, height: 107)
        // 제일 밑에 있는 label -> 그림자표현하기 위해서 만든것
        
        
        // 제일 상단 view design
        contentsView.layer.cornerRadius = 7
        contentsView.clipsToBounds = true
        
        // 제일 상단 view design
        
        
        
        
        // tableviewcell 에 필요한 여러가지 정보 이제 코딩한다!
        QuestionNameLabel.text = "별 헤는 밤"
        QuestionNameLabel.frame = CGRect(x: 15, y: 14, width: 236, height: 17)
        
        if memo.dummyMemoList.count > 0{
            print("hi memolist")
            for i in 0..<memo.dummyMemoList.count{
                 ContentsPreviewLabel.text = memo.dummyMemoList[i]
            }
            
        }
        
        if memo.dummyMemotitleList.count > 0{
            print("hi titlelist")
            for i in 0..<memo.dummyMemotitleList.count{
                QuestionNameLabel.text = memo.dummyMemotitleList[i]
            }
            
        }
        
        

        
        ProfileImageView.image = UIImage(named: "profileimagetest.jpeg")
        ProfileImageView.frame(forAlignmentRect: CGRect(x: 303, y: 14, width: 55, height: 55))
        
        
        CommentsImageVIew.image = UIImage(named: "comment@3x.png")
        
        
        // tableviewcell 에 필요한 여러가지 정보 이제 코딩한다!
        
        
        
        
        
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
