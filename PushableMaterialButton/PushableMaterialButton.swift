//
//  PushableMaterialButton.swift
//  PushableMaterialButton
//
//  Created by 平岡修 on 2021/05/22.
//

import UIKit

class PushableMaterialButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {() -> Void in
                    self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95);
                    self.alpha = 0.9
                },completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {() -> Void in
                    self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
                    self.alpha = 1
                },completion: nil)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {() -> Void in
                    self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
                    self.alpha = 1
                },completion: nil)
    }
    
    private func addShadow(color: UIColor) {
        self.layer.shadowOffset = CGSize(width: 1, height: 1 )
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1.0
    }
    
    
}
