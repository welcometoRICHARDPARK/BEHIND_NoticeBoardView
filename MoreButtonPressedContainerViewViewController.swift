//
//  MoreButtonPressedContainerViewViewController.swift
//  BehindNoticeBoard
//
//  Created by 박대희 on 2020/08/29.
//  Copyright © 2020 richard. All rights reserved.
//

import UIKit

class MoreButtonPressedContainerViewViewController: UIViewController {
    
    @IBOutlet weak var deleteImage: UIImageView!
    @IBOutlet weak var reportButton: UIImageView!
    @IBOutlet weak var scrapButton: UIImageView!
    
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var exitButton: UIButton!
    @IBAction func exitButtonAction(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromBottom
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
        print("clicked")
    }
    
    @IBOutlet var headerView: UIView!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        exitButton.setImage(UIImage(named: "cancel_bright"), for: .normal)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
            containerView.layer.mask = maskLayer
        containerView.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
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
