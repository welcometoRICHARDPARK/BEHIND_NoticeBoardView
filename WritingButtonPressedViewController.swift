//
//  WritingButtonPressedViewController.swift
//  BehindNoticeBoard
//
//  Created by 박대희 on 2020/08/16.
//  Copyright © 2020 richard. All rights reserved.
//

import UIKit
import Alamofire

class WritingButtonPressedViewController: UIViewController, UITextViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var cameraButtonView: UIView!
    @IBOutlet weak var titleWriting: UITextField!
    
    @IBOutlet weak var contentsWriting: UITextView!
    @IBOutlet weak var underLineDesign: UILabel!
    
    @IBOutlet weak var buttonSetView: UIView!
    @IBOutlet weak var freeButton: UIButton!
    @IBAction func freeButtonAction(_ sender: Any) {
        
        if freeButton.currentImage == image2{
            freeButton.setImage(image1, for: .normal)
            freeButton.setTitleColor(UIColor(red: 95/225, green: 75/225, blue: 139/225, alpha: 1), for: .normal)
            questionButton.setImage(image2, for: .normal)
            questionButton.setTitleColor(UIColor(red: 140/225, green: 140/225, blue: 140/225, alpha: 1), for: .normal)
            informationButton.setImage(image2, for: .normal)
            informationButton.setTitleColor(UIColor(red: 140/225, green: 140/225, blue: 140/225, alpha: 1), for: .normal)
        }else if freeButton.currentImage == image1{
            freeButton.setImage(image2, for: .normal)
            freeButton.setTitleColor(UIColor(red: 140/225, green: 140/225, blue: 140/225, alpha: 1), for: .normal)
        }
        
        
    }
    @IBOutlet weak var informationButton: UIButton!
    @IBAction func informationButtonAction(_ sender: Any) {
        
        
        if informationButton.currentImage == image2{
            informationButton.setImage(image1, for: .normal)
            informationButton.setTitleColor(UIColor(red: 95/225, green: 75/225, blue: 139/225, alpha: 1), for: .normal)
            freeButton.setImage(image2, for: .normal)
            freeButton.setTitleColor(UIColor(red: 140/225, green: 140/225, blue: 140/225, alpha: 1), for: .normal)
            questionButton.setImage(image2, for: .normal)
            questionButton.setTitleColor(UIColor(red: 140/225, green: 140/225, blue: 140/225, alpha: 1), for: .normal)
            
        }else{
            informationButton.setImage(image2, for: .normal)
            informationButton.setTitleColor(UIColor(red: 140/225, green: 140/225, blue: 140/225, alpha: 1), for: .normal)
        }
    }
    @IBOutlet weak var questionButton: UIButton!
    @IBAction func questionButtonAction(_ sender: Any) {
        if questionButton.currentImage == image2{
            questionButton.setImage(image1, for: .normal)
            questionButton.setTitleColor(UIColor(red: 95/225, green: 75/225, blue: 139/225, alpha: 1), for: .normal)
            informationButton.setImage(image2, for: .normal)
            informationButton.setTitleColor(UIColor(red: 140/225, green: 140/225, blue: 140/225, alpha: 1), for: .normal)
            freeButton.setImage(image2, for: .normal)
            freeButton.setTitleColor(UIColor(red: 140/225, green: 140/225, blue: 140/225, alpha: 1), for: .normal)
            
        }else{
            questionButton.setImage(image2, for: .normal)
            questionButton.setTitleColor(UIColor(red: 140/225, green: 140/225, blue: 140/225, alpha: 1), for: .normal)
        }
    }
    
    
    let image1 = UIImage(named: "select_violet")
    let image2 = UIImage(named: "select_gray")
    
    
    
    func placeholderSetting() {
            contentsWriting.delegate = self // txtvReview가 유저가 선언한 outlet
            contentsWriting.text = "더불어 성장하는 비하인드, 소통하는 비하인드를 위한 내용을 작성해 주세요."
            contentsWriting.textColor = UIColor.lightGray
            
        }
        
        
        // TextView Place Holder
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == UIColor.lightGray {
                textView.text = nil
                textView.textColor = UIColor.black

            }
            
        }
    
        // TextView Place Holder
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = "더불어 성장하는 비하인드, 소통하는 비하인드를 위한 내용을 작성해 주세요."
                textView.textColor = UIColor.lightGray
            }
        }
    // TextView Place Holder
    
    
    
    
    @objc private func popToPrevious(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func writingSomething(){
        guard let content = contentsWriting.text, content.count > 0  else{
            return
        }
        memo.dummyMemoList.append(content)
        
        guard let title = titleWriting.text, title.count > 0 else{
            return
        }
        memo.dummyMemotitleList.append(title)
        
        let url = "https://behind-server.herokuapp.com/article"
        
        let headers:HTTPHeaders = [
            "Authorization" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzY2hvb2xJZCI6IjIwMTcwNTgwIn0.BMlsW_hgF2Bals0_ahk1EOVbfnjUu6KBnw3syiOpBlw",
            "Accept" : "application/json;charset=utf-8"
        ]
        let commentParams = Comment()
        commentParams.title = memo.dummyMemotitleList[0]
        commentParams.memo = memo.dummyMemoList[0]
        commentParams.lectureId = "1"
        commentParams.type = "FREE"
        
        print("commentParams dictionary Function : \(String(describing: commentParams.toJSON2()))")
        
//        let param = CreateOrUpdateRequestPostDto(createOrUpdateRequestPostDto: CommentVO(title: memo.dummyMemotitleList[0], content: memo.dummyMemoList[0], lectureId: "1", type: "FREE"))
//        let param2 = ["createOrUpdateRequestPostDto":"""
//                        {
//                        "title":"someone's comment2",
//                        "content": "This is a free content 4",
//                        "lectureId": "1",
//                        "type":"FREE"
//                        }
//                        """]
//        print("param2 -- \n \(param2)")
//        print("param -- \n \(param)")
//        AF.request(url, method: .post, parameters: param2 , encoder: JSONParameterEncoder.default, headers: headers).responseJSON {(response) in
//            debugPrint(response)
//        }
//
//        let strData = """
//                        {
//                        "title":"someone's comment2",
//                        "content": "This is a free content 4",
//                        "lectureId": "1",
//                        "type":"FREE"
//                        }
//                        """
//        AF.upload(multipartFormData: { (multipartFormData) in
//            multipartFormData.append(strData.data(using: .utf8)!, withName: "createOrUpdateRequestPostDto")
//        }, to: url).responseJSON { (response) in
//            debugPrint(response)
//        }
//

        if let json = commentParams.toJSON(){
            AF.request(url, method: .post, parameters: json , encoder: JSONParameterEncoder.default, headers: headers).responseJSON {(response) in
                debugPrint(response)
            }
        }else {
            //error 처리
            let alert = UIAlertController(title: "Alert", message: "다시 입력해주세요", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        
        
        print("title:\(memo.dummyMemotitleList)")
        print("memo:\(memo.dummyMemoList)")
        
        navigationController?.popViewController(animated: true)
        
        print("button pressed")
    }
    
    
    
    
    
    
    
    
    
    // 키보드가 올라감에 따라 화면 조정해주는 것에 대한 함수 + 아무데나 터치하면 키보드 사라지는것
    var keyboardshowis = true
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        
        if keyboardshowis == true{
            self.cameraButtonView.frame.origin.y -= keyboardFrame.height
            keyboardshowis = false
        }
    }
    
    
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
       
        
        if keyboardshowis == false{
            self.cameraButtonView.frame.origin.y += keyboardFrame.height
            keyboardshowis = true
        }
       
    }
    
    @objc func dismissKeyboard() {
        scrollview.endEditing(true)
    }
    // 키보드가 올라감에 따라 화면 조정해주는 것에 대한 함수 + 아무데나 터치하면 키보드 사라지는것
    
    
    
    // image 게시글에 작성할때 사진 올리는거 올라오게 하는거 관련된 code
    public var colors:[UIColor] = [UIColor]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? imageCollectionViewCell {
            cell.bgColor = colors[indexPath.row]
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 80, height: 80)
    }
    
    
    @IBAction func cameraButtonClickingAction(_ sender: Any) {
        print("a")
//        colors.append(.lightGray)
//        collectionView.reloadData()
        
        let setImage:UIImage = graycameraimage!
        
        switch setImage {
        case graycameraimage:
            colors.append(.lightGray)
            collectionView.reloadData()
            print("wow")
            
        default:
            print("nothing")
        }
        
        if cameraButton.currentImage == graycameraimage{
            cameraButton.setImage(violetcameraimage, for: .normal)
            collectionView.isHidden = false
           
        } else if cameraButton.currentImage == violetcameraimage{
            cameraButton.setImage(graycameraimage, for: .normal)
            collectionView.isHidden = true
        }
        
    }
    
    
    let graycameraimage = UIImage(named: "photo_camera_gray@3x copy.png")
    let violetcameraimage = UIImage(named: "photo_camera@3x copy.png")
    
    
    var camerabuttonclickingis = true
    let originYvalue = 822

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "글쓰기"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        freeButton.setImage(image2, for: .normal)
        informationButton.setImage(image2, for: .normal)
        questionButton.setImage(image2, for: .normal)
        cameraButton.setImage(graycameraimage, for: .normal)
        
        
        collectionView.register(imageCollectionViewCell.self, forCellWithReuseIdentifier: imageCollectionViewCell.identifier)
        
        
        // 키보드 관련 notificationcenter
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        // 키보드 관련 notificationcenter
        
        
        
        // camera 버튼 setting
        cameraButton.setImage(UIImage(named: "photo_camera_gray@3x copy.png"), for: .normal)
        cameraButton.adjustsImageWhenHighlighted = false
        // camera 버튼 setting
        
        
        
        
        // 글쓰기 viewcontroller에서 leftnavigationbar setting
        let button:UIButton = UIButton(type: .custom)
        button.setImage(UIImage(named: "navigate_before_left"), for: .normal)
        
        let leftbarbutton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = leftbarbutton
        
        button.addTarget(self, action: #selector(popToPrevious), for: .touchUpInside)
        button.adjustsImageWhenHighlighted = false
        
        
        
        let button2:UIButton = UIButton(type: .custom)
        button2.setImage(UIImage(named: "check"), for: .normal)
        button2.adjustsImageWhenHighlighted = false
        
        let rightbarbutton = UIBarButtonItem(customView: button2)
        self.navigationItem.rightBarButtonItem = rightbarbutton
        
        button2.addTarget(self, action: #selector(writingSomething), for: .touchUpInside)
        // 글쓰기 viewcontroller에서 leftnavigationbar setting
        
        
        
        
        
        // 제목과 글 사이의 선 디자인
        underLineDesign.layer.backgroundColor = UIColor(red: 234, green: 234, blue: 234, alpha: 1).cgColor
        // 제목과 글 사이의 선 디자인
        
        
        
        
        titleWriting.borderStyle = .none
        
        
        
        
        // uitextview placeholder setting
        placeholderSetting()
        // uitextview placeholder setting
        


        
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

