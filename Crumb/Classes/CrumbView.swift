import UIKit

public class CrumbView: UIView {
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    public func showParticles(with image: UIImage) {
    let resizedImage: UIImage = image.resized(to: CGSize(width: 20, height: 20))
        starParticle.contents = resizedImage.cgImage
        particleEmitter.emitterCells = [starParticle]
        self.layer.addSublayer(particleEmitter)
    }
    
    @objc func handleTap(sender: UIPanGestureRecognizer) {
        
        particleEmitter.emitterPosition = sender.location(in: self)
        
        if sender.state == .ended {
            particleEmitter.lifetime = 0
        } else if sender.state == .began {
            // Here you can set the image you want to display as particles
            if let image = UIImage(named: "your_image_name") {
                showParticles(with: image)
            }
            particleEmitter.lifetime = 1.0
        }
    }
    
    // MARK: - Properties
    lazy var panGestureRecognizer:
    UIPanGestureRecognizer = {
        let gestureRecognizer = UIPanGestureRecognizer()
        gestureRecognizer.addTarget(self, action: #selector(handleTap))
        return gestureRecognizer
    }()
    
    lazy var particleEmitter: CAEmitterLayer = {
        let emitter = CAEmitterLayer()
        emitter.emitterShape = .point
        emitter.renderMode = .additive
        return emitter
    }()
    
    let starParticle = StarParticle()
    
    // MARK: - UI Setup
    func setupUI() {
        //self.backgroundColor = .black
        self.addGestureRecognizer(panGestureRecognizer)
    }
    
}

public class StarParticle: CAEmitterCell {
    
    public override init() {
        super.init()
        self.birthRate = 30
        self.lifetime = 1.0
        self.velocity = 100
        self.velocityRange = 50
        self.emissionLongitude = 90
        self.emissionRange = .pi
        self.spinRange = 5
        self.scale = 0.5
        self.scaleRange = 0.25
        self.alphaSpeed = -1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UIImage {
    func resized(to newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }
}
