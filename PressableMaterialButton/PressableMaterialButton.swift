//
//  PressableMaterialButton.swift
//  PressableMaterialButton
//
//  Created by 平岡修 on 2021/05/23.
//

import UIKit

class PressableMaterialButton: UIButton {
    
    private var shadowOffsetHeight: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Configure UI
    
    private func configureUI() {
        self.layer.cornerRadius = self.frame.height / 2
        addShadow(offsetHeight: 20)
    }
    
    private func addShadow(offsetHeight: CGFloat) {
        shadowOffsetHeight = offsetHeight
        self.layer.shadowOffset = CGSize(width: 0, height: shadowOffsetHeight)
        self.layer.shadowColor = UIColor.shadowColorRed.cgColor
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 1.0
    }
}

// MARK: - Touches methods
extension PressableMaterialButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        pressedButtonAnimation()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        releasedButtonAnimation()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        releasedButtonAnimation()
    }
    
    private func pressedButtonAnimation() {
        addShadowHeightAnimation(from: self.shadowOffsetHeight, to: 0, option: .easeIn)
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn) {
            self.transform = CGAffineTransform(translationX: 0, y: self.shadowOffsetHeight)
        }
    }
    
    private func releasedButtonAnimation() {
        addShadowHeightAnimation(from: 0, to: self.shadowOffsetHeight, option: .easeOut)
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut) {
            self.transform = CGAffineTransform.identity
        }
    }
    
    private func addShadowHeightAnimation(from fromValue: CGFloat, to toValue: CGFloat, option: CAMediaTimingFunctionName) {
        let animation = CABasicAnimation(keyPath: "shadowOffset")
        animation.duration = 0.1
        animation.fromValue = CGSize(width: 0, height: fromValue)
        animation.toValue = CGSize(width: 0, height: toValue)
        animation.timingFunction = CAMediaTimingFunction(name: option)
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
    }
}
