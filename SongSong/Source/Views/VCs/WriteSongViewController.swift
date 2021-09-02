import UIKit
import SnapKit
import Then


class WriteSongViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageView()
        setBackground()
    }
    func setBackground(){
        self.view.backgroundColor = UIColor.mint10
    }
    
    func setImageView(){
        let screenHeight = UIScreen.main.bounds.height
        
        let songsongImageView = UIImageView().then{
            $0.image = UIImage(named: "songsongSmile")
        }
        self.view.addSubview(songsongImageView)

        
        
        songsongImageView.snp.makeConstraints{
            $0.width.equalTo(170)
            $0.height.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(screenHeight*0.2)
        }
        
        
    }
    

}
