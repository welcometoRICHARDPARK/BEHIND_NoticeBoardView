//
//  underCommentsSectionRowTableViewCell.swift
//  BehindNoticeBoard
//
//  Created by 박대희 on 2020/08/11.
//  Copyright © 2020 richard. All rights reserved.
//

import UIKit

class underCommentsSectionRowTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var underCommentLabel: UILabel!
    @IBOutlet weak var underCommentType: UILabel!
    @IBOutlet weak var underCommentUpdateTimeLabel: UILabel!
    @IBOutlet weak var reportButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 0.5
        label.backgroundColor = UIColor.clear
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
        label.layer.shadowOpacity = 0.7
        label.layer.shadowRadius = 4
        label.frame =  CGRect(x: 46, y: 9, width: 348, height: 116)
        
        
        contentsView.layer.cornerRadius = 7
        contentsView.clipsToBounds = true
        
        
        reportButton.setImage(UIImage( named: "report_small"), for: .normal)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
