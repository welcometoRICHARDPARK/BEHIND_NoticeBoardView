//
//  commentsSectionTableViewCell.swift
//  BehindNoticeBoard
//
//  Created by 박대희 on 2020/08/11.
//  Copyright © 2020 richard. All rights reserved.
//

import UIKit

protocol CommentCellDelegate {
    func deleteComment(id:Int)
}

class commentsSectionTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentTypeLabel: UILabel!
    @IBOutlet weak var commentUpdateTimeLabel: UILabel!
    @IBOutlet weak var trashButton: UIButton!
    
    var delegate : CommentCellDelegate?
    var commentId : Int?
    
    @IBAction func trashButtonPressed(_ sender: Any) {
        guard let commentId = self.commentId else { return }
        self.delegate?.deleteComment(id: commentId)
        print("trashButton Pressed!")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        trashButton.setImage(UIImage(named: "trash_violet"), for: .normal)
        
        
        
        //tableviewcell 그림자 디자인
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 0.5
        label.backgroundColor = UIColor.clear
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
        label.layer.shadowOpacity = 0.7
        label.layer.shadowRadius = 4
        label.frame =  CGRect(x: 20, y: 11, width: 374, height: 116)
        //tableviewcell 그림자 디자인
        
        
        // 상단 view design
        contentsView.layer.cornerRadius = 7
        contentsView.clipsToBounds = true
        
        // 상단 view design
        
        
        
        
        
        // Initialization code
    }

    override func prepareForReuse() {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
