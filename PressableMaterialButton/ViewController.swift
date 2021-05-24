//
//  ViewController.swift
//  PressablebleMaterialButton
//
//  Created by 平岡修 on 2021/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var neverPressLabel: UILabel!
    
    @IBAction private func pressedButton() {
        neverPressLabel.text = "ちゅ😘"
    }
    
    @IBAction private func releasedButton() {
        neverPressLabel.text = "絶対に押すな！！"
    }
}
