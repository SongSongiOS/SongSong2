//
//  ConseptViewController.swift
//  SongSong
//
//  Created by 박익범 on 2021/09/05.
//

import UIKit
import Then
import SnapKit

class ConseptViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var selectConcept: String = ""
    
    let idolButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "button2"), for: .normal)
        $0.setTitle("아이돌", for: .normal)
        $0.setTitleColor(UIColor.black10, for: .normal)
        $0.titleLabel?.font = UIFont.binggraeSamancoBold(ofSize: 20)
        $0.addTarget(self, action: #selector(idolButtonClicked(_:)), for: .touchUpInside)

    }
    let hiphopButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "button2"), for: .normal)
        $0.setTitle("힙합", for: .normal)
        $0.titleLabel?.font = UIFont.binggraeSamancoBold(ofSize: 20)
        $0.setTitleColor(UIColor.black10, for: .normal)
        $0.addTarget(self, action: #selector(hiphopButtonClicked(_:)), for: .touchUpInside)

    }
    let baladButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "button2"), for: .normal)
        $0.setTitle("발라드", for: .normal)
        $0.titleLabel?.font = UIFont.binggraeSamancoBold(ofSize: 20)
        $0.setTitleColor(UIColor.black10, for: .normal)
        $0.addTarget(self, action: #selector(baladButtonClicked(_:)), for: .touchUpInside)

    }
    let popButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "button2"), for: .normal)
        $0.setTitle("POP", for: .normal)
        $0.titleLabel?.font = UIFont.binggraeSamancoBold(ofSize: 20)
        $0.setTitleColor(UIColor.black10, for: .normal)
        $0.addTarget(self, action: #selector(popButtonClicked(_:)), for: .touchUpInside)

    }
    let bandButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "button2"), for: .normal)
        $0.setTitle("밴드", for: .normal)
        $0.titleLabel?.font = UIFont.binggraeSamancoBold(ofSize: 20)
        $0.setTitleColor(UIColor.black10, for: .normal)
        $0.addTarget(self, action: #selector(bandButtonClicked(_:)), for: .touchUpInside)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()

    }
    @objc private func outButtonClicked(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func idolButtonClicked(_ sender: UIButton){
        print(idolButton.titleLabel?.text)
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func hiphopButtonClicked(_ sender: UIButton){
        print(hiphopButton.titleLabel?.text)
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func baladButtonClicked(_ sender: UIButton){
        print(baladButton.titleLabel?.text)
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func popButtonClicked(_ sender: UIButton){
        print(popButton.titleLabel?.text)
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func bandButtonClicked(_ sender: UIButton){
        print(bandButton.titleLabel?.text)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func setLayout(){
            
        self.view.backgroundColor = UIColor.black10.withAlphaComponent(0.3)
        
        let outButton = UIButton().then{
            $0.backgroundColor = .none
            $0.addTarget(self, action: #selector(outButtonClicked(_:)), for: .touchUpInside)
        }
        
        let backGroundView = UIView().then{
            $0.backgroundColor = UIColor.white10
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
        
      
        self.view.addSubview(outButton)
        self.view.addSubview(backGroundView)
        backGroundView.addSubview(idolButton)
        backGroundView.addSubview(hiphopButton)
        backGroundView.addSubview(baladButton)
        backGroundView.addSubview(popButton)
        backGroundView.addSubview(bandButton)
        
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
            $0.height.equalTo(height * 0.4)
        }
        idolButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(50)
            $0.width.equalTo(width * 0.35)
        }
        hiphopButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
            $0.width.equalTo(idolButton)
        }
        baladButton.snp.makeConstraints{
            $0.top.equalTo(idolButton.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(50)
            $0.width.equalTo(idolButton)

        }
        popButton.snp.makeConstraints{
            $0.top.equalTo(hiphopButton.snp.bottom).offset(40)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(50)
            $0.width.equalTo(idolButton)

        }
        bandButton.snp.makeConstraints{
            $0.top.equalTo(baladButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(popButton.snp.width)
            $0.height.equalTo(50)
            $0.width.equalTo(idolButton)

        }
        
        
    }
    
}
