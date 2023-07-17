import UIKit

class CustomView: UIView {
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    var customBackgroundColor: UIColor? {
        didSet {
            backgroundColor = customBackgroundColor ?? UIColor.clear
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        self.backgroundColor = customBackgroundColor
    }
}

class CacaViewController: UIViewController {
    @IBOutlet weak var currentMissionTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customView = CustomView(frame: CGRect(x: 80, y: 570.5, width: 1020, height: 0))
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.cornerRadius = 10
        customView.customBackgroundColor = UIColor(named: "backgroundBlue")
        
        view.addSubview(customView)
        //customView.isHidden = true
        
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            customView.topAnchor.constraint(equalTo: currentMissionTitle.bottomAnchor, constant: 30),
            customView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
