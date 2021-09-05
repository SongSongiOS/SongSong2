import UIKit
import SnapKit
import Then


class WriteSongViewController: UIViewController {
        
    var animationCnt = 0
    
    let songsongImageView = UIImageView().then{
        $0.image = UIImage(named: "songsongSmile")
    }
    let selectButton = UIButton().then{
        $0.setTitle("가수이름", for: .normal)
        $0.titleLabel?.font = UIFont.binggraeSamancoRegular(ofSize: 20)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.backgroundColor = UIColor.white10
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.tag = 1
        $0.addTarget(self, action: #selector(selectButtonClicked(_:)), for: .touchUpInside)
    }
   
    let nextButton = UIButton().then{
        $0.setTitle("입력했송!", for: .normal)
        $0.titleLabel?.font = UIFont.binggraeSamancoBold(ofSize: 30)
        $0.setTitleColor(UIColor.black10, for: .normal)
        $0.backgroundColor = UIColor.white10
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(nextButtonClicked(_:)), for: .touchUpInside)
    }
    let askLabel = UILabel().then{
        $0.font = UIFont.binggraeSamancoRegular(ofSize: 20)
        $0.text = "가수가 누구송?"
        $0.textColor = UIColor.black10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setLayout()
        setSongSongAnimation()
    }
//MARK: Func
    @objc private func nextButtonClicked(_ sender: UIButton){
        
        switch selectButton.tag{
        case 1:
            animateButton()
            selectButton.setTitle("노래제목", for: .normal)
            askLabel.text = "노래제목은 무엇이송?"
            selectButton.tag = 2
        case 2:
            animateButton()
            selectButton.setTitle("장르", for: .normal)
            askLabel.text = "장르는 뭐송?"
            selectButton.tag = 3
        case 3:
            animateButton()
            selectButton.setTitle("가사", for: .normal)
            askLabel.text = "노래가사를 적어주송!"
            selectButton.tag = 4
        default:
            print("default")
        }
    }
    @objc private func selectButtonClicked(_ sender: UIButton){
        guard let insertVC = UIStoryboard(name: "NameCutsomView", bundle: nil).instantiateViewController(identifier: "NameCustomViewController") as? NameCustomViewController else {return}
        guard let conceptVC = UIStoryboard(name: "Consept", bundle: nil).instantiateViewController(identifier: "ConseptViewController") as? ConseptViewController else {return}
        switch selectButton.tag {
        case 1:
            insertVC.tag = selectButton.tag
            insertVC.modalPresentationStyle = .overFullScreen
            insertVC.modalTransitionStyle = .crossDissolve
            self.present(insertVC, animated: true, completion: nil)
        case 2:
            insertVC.tag = selectButton.tag
            insertVC.modalPresentationStyle = .overFullScreen
            insertVC.modalTransitionStyle = .crossDissolve
            self.present(insertVC, animated: true, completion: nil)
        case 3:
            conceptVC.modalPresentationStyle = .overFullScreen
            conceptVC.modalTransitionStyle = .crossDissolve
            self.present(conceptVC, animated: true, completion: nil)
        default:
            print("dasf")
        }
    }
    
    
//MARK: Animation
    func animateButton(){
        UIView.animate(withDuration: 1, delay: 0, options: []){
            self.askLabel.frame = CGRect(x: self.askLabel.frame.origin.x, y: self.askLabel.frame.origin.y, width: 1000, height: 50)
        }
    }
    func setSongSongAnimation(){
        UIView.animate(withDuration: 1,delay: 0,options: [.repeat, .autoreverse]){
            let scale = CGAffineTransform(translationX: 0, y: 15)
            self.songsongImageView.transform = scale
        }
    }
    
//MARK: setLayout
    func setBackground(){
        self.view.backgroundColor = UIColor.mint10
    }
    
    func setLayout(){
        let screenHeight = UIScreen.main.bounds.height
        
        let mentView = UIView().then{
            $0.backgroundColor = .none
        }
        let nameView = UIView().then{
            $0.backgroundColor = UIColor.black10
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }
        let nameLabel = UILabel().then{
            $0.font = UIFont.binggraeSamancoBold(ofSize: 20)
            $0.text = "송송이"
            $0.textColor = UIColor.white10
        }
        let askView = UIView().then{
            $0.backgroundColor = UIColor.white10
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
        
       
        
        self.view.addSubview(songsongImageView)
        self.view.addSubview(mentView)
        mentView.addSubview(askView)
        mentView.addSubview(nameView)
        nameView.addSubview(nameLabel)
        askView.addSubview(askLabel)
        self.view.addSubview(selectButton)
        self.view.addSubview(nextButton)

        
        songsongImageView.snp.makeConstraints{
            $0.width.equalTo(130)
            $0.height.equalTo(160)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(screenHeight*0.2)
        }
        mentView.snp.makeConstraints{
            $0.top.equalTo(songsongImageView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(130)
        }
        nameView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
        nameLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        askView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
            $0.height.equalTo(100)
        }
        askLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(10)
            $0.width.equalTo(500)
            $0.height.equalTo(50)
        }
        selectButton.snp.makeConstraints{
            $0.top.equalTo(mentView.snp.bottom).offset(0)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(50)
        }

        nextButton.snp.makeConstraints{
            $0.top.equalTo(selectButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(50)
        }

        
    }
    

}
