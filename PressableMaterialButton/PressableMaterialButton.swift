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
        addShadow(color: .red, offsetHeight: 20)
    }
    
    private func addShadow(color: UIColor, offsetHeight: CGFloat) {
        shadowOffsetHeight = offsetHeight
        self.layer.shadowOffset = CGSize(width: 0, height: shadowOffsetHeight)
        self.layer.shadowColor = color.cgColor
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
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn) {
            self.transform = CGAffineTransform(translationX: 0, y: self.shadowOffsetHeight)
            self.layer.shadowOffset.height = 0
        }
    }
    
    private func releasedButtonAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn) {
            self.transform = CGAffineTransform.identity
            self.layer.shadowOffset.height = self.shadowOffsetHeight
        }
    }
}
