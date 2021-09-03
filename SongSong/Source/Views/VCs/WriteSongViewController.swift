import UIKit
import SnapKit
import Then


class WriteSongViewController: UIViewController {
        
    var animationCnt = 0
    
    let songsongImageView = UIImageView().then{
        $0.image = UIImage(named: "songsongSmile")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setLayout()
        setSongSongAnimation()
    }
    
//MARK: Animation
    func setSongSongAnimation(){
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: [.repeat, .autoreverse]){
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/5){
                let scale = CGAffineTransform(translationX: -25, y: 10)
                self.songsongImageView.transform = scale
            }
            UIView.addKeyframe(withRelativeStartTime: 1/5, relativeDuration: 2/5){
                let scale = CGAffineTransform(translationX: -25, y: 0)
                self.songsongImageView.transform = scale
            }
            UIView.addKeyframe(withRelativeStartTime: 2/5, relativeDuration: 3/5){
                let scale = CGAffineTransform(translationX: 25, y: 10)
                self.songsongImageView.transform = scale
            }
            UIView.addKeyframe(withRelativeStartTime: 3/5, relativeDuration: 4/5){
                let scale = CGAffineTransform(translationX: 25, y: 0)
                self.songsongImageView.transform = scale
            }
            UIView.addKeyframe(withRelativeStartTime: 4/5, relativeDuration: 5/5){
                let scale = CGAffineTransform(translationX: 25, y: 10)
                self.songsongImageView.transform = scale
            }
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
        let askLabel = UILabel().then{
            $0.font = UIFont.binggraeSamancoRegular(ofSize: 20)
            $0.text = "가수가 누구송?"
            $0.textColor = UIColor.black10
        }
        let singerButton = UIButton().then{
            $0.setTitle("가수이름", for: .normal)
            $0.titleLabel?.font = UIFont.binggraeSamancoRegular(ofSize: 20)
            $0.setTitleColor(UIColor.gray, for: .normal)
            $0.backgroundColor = UIColor.white10
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
        let songButton = UIButton().then{
            $0.setTitle("노래제목", for: .normal)
            $0.titleLabel?.font = UIFont.binggraeSamancoRegular(ofSize: 20)
            $0.setTitleColor(UIColor.gray, for: .normal)
            $0.backgroundColor = UIColor.white10
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
        let typeButton = UIButton().then{
            $0.setTitle("장르", for: .normal)
            $0.titleLabel?.font = UIFont.binggraeSamancoRegular(ofSize: 20)
            $0.setTitleColor(UIColor.gray, for: .normal)
            $0.backgroundColor = UIColor.white10
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
        let scriptButton = UIButton().then{
            $0.setTitle("가사(30자이내)", for: .normal)
            $0.titleLabel?.font = UIFont.binggraeSamancoRegular(ofSize: 20)
            $0.setTitleColor(UIColor.gray, for: .normal)
            $0.backgroundColor = UIColor.white10
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
        let nextButton = UIButton().then{
            $0.setTitle("입력했송!", for: .normal)
            $0.titleLabel?.font = UIFont.binggraeSamancoBold(ofSize: 30)
            $0.setTitleColor(UIColor.black10, for: .normal)
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
        self.view.addSubview(singerButton)
        self.view.addSubview(songButton)
        self.view.addSubview(typeButton)
        self.view.addSubview(scriptButton)
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
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        singerButton.snp.makeConstraints{
            $0.top.equalTo(mentView.snp.bottom).offset(0)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(50)
        }
        songButton.snp.makeConstraints{
            $0.top.equalTo(mentView.snp.bottom).offset(0)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(50)
        }
        typeButton.snp.makeConstraints{
            $0.top.equalTo(mentView.snp.bottom).offset(0)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(50)
        }
        scriptButton.snp.makeConstraints{
            $0.top.equalTo(mentView.snp.bottom).offset(0)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(50)
        }
        nextButton.snp.makeConstraints{
            $0.top.equalTo(singerButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(50)
        }
        songButton.isHidden = true
        typeButton.isHidden = true
        scriptButton.isHidden = true

        
    }
    

}
