//
//  NameCustomViewController.swift
//  SongSong
//
//  Created by 박익범 on 2021/09/05.
//

import UIKit
import SnapKit
import Then

class NameCustomViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var placeHolderText: String = ""
    var tag: Int = 1
    var userInfoText: String = ""
    
    let textField = UITextField().then{
        $0.backgroundColor = .none
        $0.borderStyle = .none
        $0.font = UIFont.binggraeSamancoRegular(ofSize: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        changeTag()
        // Do any additional setup after loading the view.
    }
    
    @objc private func okButtonClicked(_ sender: UIButton){
        userInfoText = textField.text ?? ""
        print(userInfoText)
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func outButtonClicked(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    func changeTag(){
        switch tag {
        case 2:
            placeHolderText = "노래제목"
            textField.placeholder = placeHolderText
        default:
            placeHolderText = "가수이름"
            textField.placeholder = placeHolderText
        }
    }
    
    func setLayout(){
        self.view.backgroundColor = UIColor.black10.withAlphaComponent(0.3)
        
        let backGroundView = UIView().then{
            $0.backgroundColor = UIColor.white10
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
       
        let backGroundTextView = UIView().then{
            $0.backgroundColor = UIColor.white10
        }
        let backGroundImageView = UIImageView().then{
            $0.image = UIImage(named: "smallBackLine")
        }
        let okButton = UIButton().then{
            $0.setBackgroundImage(UIImage(named: "button1"), for: .normal)
            $0.backgroundColor = UIColor.white10
            $0.setTitle("입력했송!", for: .normal)
            $0.setTitleColor(UIColor.black10, for: .normal)
            $0.titleLabel?.font = UIFont.binggraeSamancoBold(ofSize: 25)
            $0.addTarget(self, action: #selector(okButtonClicked(_:)), for: .touchUpInside)
        }
        let outButton = UIButton().then{
            $0.backgroundColor = .none
            $0.addTarget(self, action: #selector(outButtonClicked(_:)), for: .touchUpInside)
        }
        self.view.addSubview(outButton)
        self.view.addSubview(backGroundView)
        backGroundView.addSubview(backGroundTextView)
        backGroundTextView.addSubview(backGroundImageView)
        backGroundTextView.addSubview(textField)
        backGroundView.addSubview(okButton)
        
        outButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.bottom.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
        }
        
        backGroundView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(width * 0.8)
            $0.height.equalTo(height * 0.2)
        }
        
        backGroundTextView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.top.equalToSuperview().offset(10)
            $0.width.equalTo(width * 0.6)
            $0.height.equalTo(height * 0.1)
        }
        backGroundImageView.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(0)
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
        }
        textField.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(50)
        }
        okButton.snp.makeConstraints{
            $0.top.equalTo(backGroundTextView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(40)
        }
    }

}
