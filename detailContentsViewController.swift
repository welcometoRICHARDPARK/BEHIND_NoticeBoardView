//
//  detailContentsViewController.swift
//  BehindNoticeBoard
//
//  Created by 박대희 on 2020/08/09.
//  Copyright © 2020 richard. All rights reserved.
//

import UIKit
import Alamofire

class detailContentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var comment = Comment()
    var detailComments = Array<DetailComment>()
    
    var usethis = Array<CommentModel>()
    
    var cellCount:Int?
    
    var parentIndex: Int?
    
    var decide = CommentModel()
    
    var selectedIndexPath = IndexPath()
  
    @IBOutlet weak var selectedCommentLabel: UILabel!
    
    //view1 에 들어있는 label
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailContentsLabel: UILabel!
    @IBOutlet weak var contentsTypeLabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var updatetimeLabel: UILabel!
    
    @IBOutlet weak var subdirectoryArrowImage: UIImageView!
    @IBOutlet var controlView: UIView!
    @IBOutlet weak var writingCommentContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tableview1: UITableView!
    @IBOutlet weak var secondview: UIView!
    @IBOutlet weak var selectedContentsLabel: UILabel!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var moreButton: UIButton!
    @IBAction func moreButtonAction(_ sender: Any) {
        self.definesPresentationContext = true
        let childVC = self.storyboard?.instantiateViewController(withIdentifier: "moreButtonPressedView") as! MoreButtonPressedContainerViewViewController // storyboard에서 구현을 했으면 storyboard에서 상속받아 viewcontroller를 가져와야 한다
           childVC.view.backgroundColor = UIColor(red: 0/225, green: 0/225, blue: 0/225, alpha: 0.3)
           
        childVC.modalPresentationStyle = .overFullScreen
           self.present(childVC, animated: true, completion: nil)
    }
    
    @IBOutlet weak var writeCommentsTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBAction func sendButtonAction(_ sender: Any) {}
    @IBOutlet weak var showingSelectCommentView: UIView!
    
    
    
    // 대표 section 아래 들어가는 row들
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("table cell for row at")
        let i = indexPath.row
        
        if usethis[i].subCommentIs == true {
            let cell = tableview1.dequeueReusableCell(withIdentifier: "underCommentsSectionRow") as! underCommentsSectionRowTableViewCell
            let item = usethis[i]
            cell.underCommentLabel.text = item.content
            
            return cell
        }
            
        let cell = tableview1.dequeueReusableCell(withIdentifier: "SectionTableViewCell") as! commentsSectionTableViewCell
        let item = usethis[i]
        cell.commentLabel.text = item.content
        cell.commentId = item.commentId
        
        /*
        cell.delegate = self를 하게 되면
        detailContentsViewController에서 commentsSectionTableViewCell class 에 만들어 놓은 것들을 가져와서 쓸 수 있게 된다.
        실제로 cell.delegate = self를 지워버리면
        trash 버튼을 눌렀을때 아무 반응이 오지 않게 된다. 그래서 tableview.delegate = self 를 하는것도 다 그런 이유에서 이다.
        */
        
        cell.delegate = self
        return cell
    
    }
    
    // section을 포함 밑에 들어가는 row 갯수 정해주는 코드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.usethis.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 140
       }
    
    // section 갯수 정해주는 코드
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    // keyboard가 올라오면 writingCommentContainerView가 어떻게 되야하는지에 대한 코드
    var keyboardShowis = false
    @objc func keyboardWillShow(notification : NSNotification){
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        let distanceToBottom = writingCommentContainerView.frame.height - containerView.frame.height
        if keyboardShowis == false{
            let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tap)
            self.writingCommentContainerView.frame.origin.y -= keyboardFrame.height - distanceToBottom
            keyboardShowis = true
        }
    }
    @objc func keyboardWillHide(notification : NSNotification){
        guard let userInfo = notification.userInfo else{return}
        guard let keyboardsize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        
        let keyboardFrame = keyboardsize.cgRectValue
        let distanceToBottom = writingCommentContainerView.frame.height - containerView.frame.height
        if keyboardShowis == true{
            self.writingCommentContainerView.frame.origin.y += keyboardFrame.height - distanceToBottom
            keyboardShowis = false
        }
    }
    @objc func dismissKeyboard(){
        writingCommentContainerView.endEditing(true)
    }
    @objc private func popToPrevious() {
        // our custom stuff
        navigationController?.popViewController(animated: true)
    }
    @objc private func sendComments(){
        guard let content = writeCommentsTextField.text, content.count > 0 else{
            return
        }
        if showingSelectCommentView.isHidden == false{
            let newComment = DetailComment(isParent: false)
            newComment.content = content
            
            if let test = parentIndex{
                for i in (test + 1)..<detailComments.count{
                    if detailComments[i].isParent == true{
                        detailComments.insert(newComment, at: i)
                        tableview1.reloadData()
                        break
                    }
                    
                }
            }
            detailComments.append(newComment)
            detailComments.forEach{comment in
                print(comment.content)
                print(comment.isParent)
            }
            print("detailcomment : \(detailComments)")
        }else{
            let newSubComment = DetailComment(isParent: true)
            newSubComment.content = content
            detailComments.append(newSubComment)
            print("subdetailcomment : \(detailComments)")
        }
        
        
        self.tableview1.reloadData()
    }
    func isShowingView(param:Bool) {
               var param:Bool
               param = false
               showingSelectCommentView.isHidden = param
           }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section:\(indexPath.section), row:\(indexPath.row)")
        
        selectedIndexPath = indexPath
        let i = indexPath.row
        if indexPath.row == i{
            isShowingView(param: false)
            selectedCommentLabel.text = usethis[indexPath.row].content
            parentIndex = indexPath.row
            print("parentIndex : \(String(describing: parentIndex))")
            print("selected")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        commentsNumberLabel.text = "\(usethis.count)"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://behind-server.herokuapp.com/article/1/comment"

        let headers:HTTPHeaders = [
            "Authorization" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzY2hvb2xJZCI6IjIwMTcwNTgwIn0.BMlsW_hgF2Bals0_ahk1EOVbfnjUu6KBnw3syiOpBlw",
            "Content-Type":"application/json;charset=utf-8"
        ]

        AF.request(url,
                   method: .get,
                   parameters: [:],
                   headers: headers
        ).responseJSON { [self] (response) in
            debugPrint(response)

            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()

                let print1 = try? decoder.decode([CommentModel].self, from: data)
                
                
                print("check this out : \(String(describing: print1?[0]))")
                print("check this out1 :\(String(describing: print1?[0].reComment?[0].content))")
                print("check this out2 : \(String(describing: print1))")

                if let newData = print1{
                    
                    for comment in 0..<newData.count{
                        self.usethis.append(newData[comment])
                        
                        if newData[comment].reComment != nil{
                            for recomment in 0..<newData[comment].reComment!.count{
                                newData[comment].reComment![recomment].subCommentIs = true
                                self.usethis.append(newData[comment].reComment![recomment])
                                commentsNumberLabel.text = "\(newData.count)"
                            }
                        }
                    }
                    self.tableview1.reloadData()
                }
                print("check here : \(self.usethis)")
                self.cellCount = print1?.count
                

            }
            catch let error {
                print(error)
            }
           
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            if indexPath.section == 0 && indexPath.row == 0{
                let cell = tableview1.dequeueReusableCell(withIdentifier: "SectionTableViewCell") as! commentsSectionTableViewCell
    //            let item = usethis[0]
                cell.commentLabel.text = "item.content"
                return cell
            }


           return UITableViewCell()
        }
        
        self.tableview1.delegate = self
        self.tableview1.dataSource = self
       
        title = "Academic Writing in English1"
        
        sendButton.addTarget(self, action: #selector(sendComments), for: .touchUpInside)
        // 전 view의 데이터 받아서 보여주기 (mainContent)
        titleLabel.text = comment.title
        detailContentsLabel.text = comment.memo
        // 전 view의 데이터 받아서 보여주기 (mainContent)
        moreButton.setImage(UIImage(named: "more"), for: .normal)
        sendButton.setImage(UIImage(named: "subtract"), for: .normal)
        showingSelectCommentView.isHidden = true
        subdirectoryArrowImage.image = UIImage(named: "subdirectory_arrow_right")
        sendButton.setImage(UIImage(named: "subtract"), for: .normal)
        
        // 키보드 관련 notificationcenter
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let button:UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "navigate_before_left"), for: .normal)
        
        let leftbarbutton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = leftbarbutton
        
        button.addTarget(self, action: #selector(popToPrevious), for: .touchUpInside)
        
        button.adjustsImageWhenHighlighted = false
        
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.selectedContentsLabel.frame
        rectShape.position = self.selectedContentsLabel.center
        rectShape.path = UIBezierPath(roundedRect: self.selectedContentsLabel.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 10  , height: 10)).cgPath

         self.selectedContentsLabel.layer.backgroundColor = UIColor.green.cgColor
        //Here I'm masking the textView's layer with rectShape layer
         self.selectedContentsLabel.layer.mask = rectShape
        
        selectedContentsLabel.layer.borderWidth = 0.5
        selectedContentsLabel.layer.borderColor = UIColor.white.cgColor
        selectedContentsLabel.backgroundColor = UIColor.clear
        selectedContentsLabel.layer.shadowColor = UIColor.black.cgColor
        selectedContentsLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        selectedContentsLabel.layer.shadowOpacity = 20
        selectedContentsLabel.layer.shadowRadius = 4.0
        selectedContentsLabel.frame = CGRect(x: 0, y: 40, width: 414, height: 158)
        
        rectShape.bounds = self.view1.frame
        rectShape.position = self.view1.center
        rectShape.path = UIBezierPath(roundedRect: self.view1.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        
        self.view1.layer.mask = rectShape
        self.tableview1.separatorStyle = .none
        
        // "몇 개의 댓글이 기다립니다"에 대한 코드
        commentsNumberLabel.font = UIFont(name: "210MGothic080 OTF.otf", size: 14.0)
        numberofComments.font = UIFont(name: "210MGothic010OTF", size: 14.0)
        numberofComments.text = "개의 댓글이 기다립니다"
        // "몇 개의 댓글이 기다립니다"에 대한 코드
        
        
        writeCommentsTextField.borderStyle = .roundedRect
        writeCommentsTextField.layer.cornerRadius = 8.0
        writeCommentsTextField.layer.borderWidth = 1.0
        writeCommentsTextField.layer.borderColor = UIColor.white.cgColor
        
        // 태두리에 딱 맞겠끔 하는것
        writeCommentsTextField.layer.masksToBounds = true
        // 태두리에 딱 맞겠끔 하는것
        
        writeCommentsTextField.placeholder = "더불어 성장하는 댓글을 작성해주세요"
     
        }
    @IBOutlet weak var numberofComments: UILabel!
    @IBOutlet weak var commentsNumberLabel: UILabel!

}

extension detailContentsViewController {
    
    
}


extension detailContentsViewController : CommentCellDelegate{
    func deleteComment(id: Int) {
        print("trashButtonPresssed in detailviewcontroller")
        
        let url = "https://behind-server.herokuapp.com/article/1/comment/\(id)"
        let headers:HTTPHeaders = [
            "Authorization" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzY2hvb2xJZCI6IjIwMTcwNTgwIn0.BMlsW_hgF2Bals0_ahk1EOVbfnjUu6KBnw3syiOpBlw",
            "Content-Type":"application/json;charset=utf-8"
        ]
        AF.request(url,
                   method: .delete,
                   parameters: [:],
                   headers: headers
        ).responseJSON{(response) in
            debugPrint(response)
            print(self.usethis)
            self.usethis.remove(at: 6)
            self.tableview1.reloadData()
            
        }
    }
}
