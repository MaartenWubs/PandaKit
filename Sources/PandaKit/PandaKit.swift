import UIKit

public class PandaKit {

    public init() {
    }
    
}

public class PNDAView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
    }
}
