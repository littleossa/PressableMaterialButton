//
//  PressableMaterialButton.swift
//  PressableMaterialButton
//
//  Created by 平岡修 on 2021/05/23.
//

import UIKit

class PressableMaterialButton: UIButton {
        
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
        self.layer.masksToBounds = false
        addShadow(color: .red)
    }
    
    private func addFrameBorder() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
    
    private func addShadow(color: UIColor) {
        self.layer.shadowOffset = CGSize(width: 0, height: 14)
        print("back", self.backgroundColor!)
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 1.0
    }
}

// MARK: - Touches methods
extension PressableMaterialButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        pressButtonAnimation()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        releaseButtonAnimation()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        releaseButtonAnimation()
    }
    
    private func pressButtonAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn) {
            self.center.y += self.layer.shadowOffset.height
            self.layer.shadowOpacity = 0
        }
    }
    
    private func releaseButtonAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn) {
            self.center.y -= self.layer.shadowOffset.height
            self.layer.shadowOpacity = 1.0
        }
    }
}
