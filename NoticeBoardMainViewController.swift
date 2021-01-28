//
//  NoticeBoardMainViewController.swift
//  BehindNoticeBoard
//
//  Created by 박대희 on 2020/08/08.
//  Copyright © 2020 richard. All rights reserved.
//

import UIKit

class NoticeBoardMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var comment = Array<Comment>()
    
    @IBOutlet weak var textFieldViewContainer: UIView!
    @IBAction func Xbutton(_ sender: Any) {
        self.textFieldViewContainer.isHidden = true
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "search"), for: .normal)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
        button.tag = 1
        button.addTarget(self, action: #selector(popTextField(_:)), for: .touchUpInside)
        self.navigationItem.title = "Academic Writing in English1"
        print("afterXbuttonPressed:\(String(describing: self.navigationItem.rightBarButtonItems?.count))")
        
    }
    
    
    
    let mycolor1 = UIColor(red: 95/225, green: 75/225, blue: 139/225, alpha: 1)
    let mycolor2 = UIColor(red: 0/225, green: 0/225, blue: 0/225, alpha: 1)
  
    @IBOutlet weak var ButtonBar: UIView!
    @IBOutlet weak var WholeContentsButton: UIButton!
    @IBAction func WholeContentsButtonClicked(_ sender: Any) {
        if WholeContentsButton.currentTitleColor == mycolor1{
            FreespaceButton.setTitleColor(mycolor2, for: .normal)
            underlineOfFreespaceButton.backgroundColor = .none
            InformationButton.setTitleColor(mycolor2, for: .normal)
            underlineOfInformationButton.backgroundColor = .none
            QuestionButton.setTitleColor(mycolor2, for: .normal)
            underlineOfQuestionButton.backgroundColor = .none
        }else if WholeContentsButton.currentTitleColor == mycolor2{
            WholeContentsButton.setTitleColor(mycolor1, for: .normal)
            underlineOfWholeContentsButton.backgroundColor = mycolor1
            FreespaceButton.setTitleColor(mycolor2, for: .normal)
            underlineOfFreespaceButton.backgroundColor = .none
            InformationButton.setTitleColor(mycolor2, for: .normal)
            underlineOfInformationButton.backgroundColor = .none
            QuestionButton.setTitleColor(mycolor2, for: .normal)
            underlineOfQuestionButton.backgroundColor = .none
        }
    }
    @IBOutlet weak var underlineOfWholeContentsButton: UIButton!
    
    
    
    @IBOutlet weak var FreespaceButton: UIButton!
    @IBAction func FreespaceButtonClicked(_ sender: Any) {
        if FreespaceButton.currentTitleColor == mycolor2{
            FreespaceButton.setTitleColor(mycolor1, for: .normal)
            underlineOfFreespaceButton.backgroundColor = mycolor1
            WholeContentsButton.setTitleColor(mycolor2, for: .normal)
            underlineOfWholeContentsButton.backgroundColor = .none
            InformationButton.setTitleColor(mycolor2, for: .normal)
            underlineOfInformationButton.backgroundColor = .none
            QuestionButton.setTitleColor(mycolor2, for: .normal)
            underlineOfQuestionButton.backgroundColor = .none
        }
    }
    @IBOutlet weak var underlineOfFreespaceButton: UIButton!
    
    
    
    
    
    @IBOutlet weak var InformationButton: UIButton!
    @IBAction func InformationButtonClicked(_ sender: Any) {
        if InformationButton.currentTitleColor == mycolor2{
            changeDefaultSetColor1(buttonName: InformationButton, underlineofbuttonName: underlineOfInformationButton)
            WholeContentsButton.setTitleColor(mycolor2, for: .normal)
            underlineOfWholeContentsButton.backgroundColor = .none
            FreespaceButton.setTitleColor(mycolor2, for: .normal)
            underlineOfFreespaceButton.backgroundColor = .none
            QuestionButton.setTitleColor(mycolor2, for: .normal)
            underlineOfQuestionButton.backgroundColor = .none
        }
    }
    @IBOutlet weak var underlineOfInformationButton: UIButton!
    
    
    @IBOutlet weak var QuestionButton: UIButton!
    @IBAction func QuestionButtonClicked(_ sender: Any) {
        if QuestionButton.currentTitleColor == mycolor2{
            changeDefaultSetColor1(buttonName: QuestionButton, underlineofbuttonName: underlineOfQuestionButton)
            changeDefaultSetColor2(buttonName: WholeContentsButton, underlineofbuttonName: underlineOfWholeContentsButton)
            changeDefaultSetColor2(buttonName: FreespaceButton, underlineofbuttonName: underlineOfFreespaceButton)
            changeDefaultSetColor2(buttonName: InformationButton, underlineofbuttonName: underlineOfInformationButton)
        }
    }
    @IBOutlet weak var underlineOfQuestionButton: UIButton!
    
    
    
    var buttonArray:[UIButton] = []
    
    
    
    
    @IBOutlet weak var createbuttonview: UIView!
    @IBOutlet weak var tableview1: UITableView!
    
    @IBOutlet weak var searchButton: UIBarButtonItem!

    @IBOutlet weak var createButton: UIButton!
    @IBAction func createButtonActivate(_ sender: Any) {
    }
    
    
  
    
    
    @objc func pressthecreateButton() {
        print("button pressed")
    }
    
   
    @objc func popTextField(_ sender: Any){
        
        if ((sender as AnyObject).tag == 1){
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.title = nil
            
            if self.navigationItem.title == nil{
                self.textFieldViewContainer.isHidden = false
            }
        
            self.textFieldViewContainer.isHidden = false
            
            print("button pressed")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if memo.dummyMemoList.count == 0{
            tableview1.isHidden = true
        }else{
            tableview1.isHidden = false
        }
        tableview1.reloadData()
        print("hi function")
    }
  
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldViewContainer.isHidden = true
        ButtonBar.layer.shadowRadius = 1
        ButtonBar.layer.shadowOpacity = 1
        ButtonBar.layer.shadowColor = UIColor.systemGray4.cgColor
        ButtonBar.layer.shadowOffset = CGSize(width: 0 , height:1)
       
        
       
        // 상단 전체, 자유, 정보, 질문 버튼 default color setting
        WholeContentsButton.setTitleColor(mycolor1, for: .normal)
        underlineOfWholeContentsButton.backgroundColor = mycolor1
        FreespaceButton.setTitleColor(mycolor2, for: .normal)
        underlineOfFreespaceButton.backgroundColor = .none
        InformationButton.setTitleColor(mycolor2, for: .normal)
        underlineOfInformationButton.backgroundColor = .none
        QuestionButton.setTitleColor(mycolor2, for: .normal)
        underlineOfQuestionButton.backgroundColor = .none
        // 상단 전체, 자유, 정보, 질문 버튼 default color setting
        
        
        
        
        // 1. 동그란 연필모양의 버튼 이미지랑 모양 잡기
        createButton.setImage(UIImage(named: "create"), for: .normal)
        createButton.addTarget(self, action: #selector(pressthecreateButton), for: .touchUpInside)
//        createButton.frame = CGRect(x: 326 , y: 754, width: 56, height: 56)
        createButton.layer.cornerRadius = 0.5 * createButton.bounds.size.width
        createButton.clipsToBounds = true
        createButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: createButton.bounds.width - createButton.bounds.height)
        createButton.imageView?.layer.cornerRadius = createButton.bounds.height/3.0
        // 1. 동그란 연필모양의 버튼 이미지랑 모양 잡기
        
        
        
        // 2. navigationcontroller 오른쪽 돋보기 모양 만들기
        
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "search"), for: .normal)
        let barButton = UIBarButtonItem(customView: button)
        
        self.navigationItem.rightBarButtonItem = barButton
        

        button.tag = 1
        button.addTarget(self, action: #selector(popTextField(_:)), for: .touchUpInside)
        
        
        print("checkthisout:\(String(describing: self.navigationItem.rightBarButtonItems?.count))")
        
        // 2. navigationcontroller 오른쪽 돋보기 모양 만들기
        
        
        // leftbaritem
        let button2 : UIButton = UIButton(type: UIButton.ButtonType.custom)
        button2.setImage(UIImage(named: "navigate_before_left"), for: .normal)
        let leftbarButton = UIBarButtonItem(customView: button2)
        
        self.navigationItem.leftBarButtonItem = leftbarButton
        
        
        
        // 3. navigationcontroller 경계 선 없애기
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        // 3. navigationcontroller 경계 선 없애기
        
        
        // 4. tableview 안에 cell 사이에 있는 선 지우기
        self.tableview1.separatorStyle = .none
        // 4. tableview 안에 cell 사이에 있는 선 지우기
        
        
        
        self.createButton.bringSubviewToFront(createbuttonview)
        
        
        
        
       
       

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let myWriting1 = self.storyboard?.instantiateViewController(identifier: "showdetail") as? detailContentsViewController
            
            let newComment = Comment()
            newComment.title = memo.dummyMemotitleList[indexPath.row]
            newComment.memo = memo.dummyMemoList[indexPath.row]
            
//            Comment.append(newComment)
//            위의 코드처럼 comment에 append를 해버리면 위에 만들어높은 변수에 저장이 되는거지 사실 다른 파일에서 데이터를 받아서 쓸수가 없다. 따라서 아래 코드처럼 myWriting1에 comment를 상속받아서 거기다가 newcomment 데이터를 주어야 하는것이다.
            myWriting1?.comment = newComment
            self.navigationController?.pushViewController(myWriting1!, animated: true)
            
            
            
            print("clicked: \(indexPath.section)")
        }
        if indexPath.row == 1 {
            let myWriting2 = self.storyboard?.instantiateViewController(identifier: "showdetail") as? detailContentsViewController
            
            self.navigationController?.pushViewController(myWriting2!, animated: true)
            
            let newComment1 = Comment()
            newComment1.title = memo.dummyMemotitleList[indexPath.row]
            newComment1.memo = memo.dummyMemoList[indexPath.row]
            comment.append(newComment1)
            print("array :\(comment.count)")
        }
        
    }
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memo.dummyMemoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        
        
        // cell눌렀을때 뒤에 회색갈로 표시되는거 사라지게 하기
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
//        let target = memo.dummyMemoList[indexPath.row]
        
        
        return cell
    }
    // cell눌렀을때 뒤에 회색갈로 표시되는거 사라지게 하기
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
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
