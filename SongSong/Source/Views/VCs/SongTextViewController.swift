//
//  SongTextViewController.swift
//  SongSong
//
//  Created by 박익범 on 2021/09/05.
//

import UIKit

class SongTextViewController: UIViewController {

    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    let textField = UITextView().then{
        $0.font = UIFont.binggraeSamancoRegular(ofSize: 20)
        $0.backgroundColor = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        placeholderSetting()
    }
    
    @objc private func outButtonClicked(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func okButtonClicked(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func placeholderSetting() {
        textField.delegate = self
        textField.text = "노래가사를 적어주숑! (100자)"
        textField.textColor = UIColor.lightGray
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
                textView.text = "노래가사를 적어주숑! (100자)"
                textView.textColor = UIColor.lightGray
            }
        }
    
    
    func setLayout(){
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        let outButton = UIButton().then{
            $0.backgroundColor = .none
            $0.addTarget(self, action: #selector(outButtonClicked(_:)), for: .touchUpInside)
        }
        
        let backgroundView = UIView().then{
            $0.backgroundColor = UIColor.white10
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
        
        let titleLabel = UILabel().then{
            $0.text = "기억에 남는 노래가사를 적어주송!"
            $0.font = UIFont.binggraeSamancoRegular(ofSize: 25)
            $0.textColor = UIColor.black10
            $0.textAlignment = .center

        }
        
        let textFieldView = UIView().then{
            $0.backgroundColor = .none
        }
        let backGroundImageView = UIImageView().then{
            $0.image = UIImage(named: "writeBackground")
        }
      
        textField.delegate = self
        let okButton = UIButton().then{
            $0.setBackgroundImage(UIImage(named: "button1"), for: .normal)
            $0.setTitle("다썻송!", for: .normal)
            $0.setTitleColor(UIColor.black, for: .normal)
            $0.titleLabel?.font = UIFont.binggraeSamancoBold(ofSize: 30)
            $0.addTarget(self, action: #selector(okButtonClicked(_:)), for: .touchUpInside)
        }
        
        
        self.view.addSubview(outButton)
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(textFieldView)
        textFieldView.addSubview(backGroundImageView)
        textFieldView.addSubview(textField)
        backgroundView.addSubview(okButton)
        
        
        outButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.bottom.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
        }
        
        backgroundView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(height * 0.7)
            $0.width.equalTo(width * 0.8)
        }
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(15)
            $0.width.equalTo(width * 0.8)
        }
        textFieldView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(height * 0.5)
        }
        backGroundImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.bottom.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
        }
        textField.snp.makeConstraints{
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(height * 0.4)
        }
        okButton.snp.makeConstraints{
            $0.top.equalTo(textFieldView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(60)
        }
        
    }


}

extension SongTextViewController: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let str = textView.text else { return true }
        let newLength = str.count + text.count - range.length
        return newLength <= 100
        
    }
    
}
