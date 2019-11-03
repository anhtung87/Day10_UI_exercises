//
//  CounterView.swift
//  Day10_UI_exercises
//
//  Created by Hoang Tung on 11/3/19.
//  Copyright © 2019 Hoang Tung. All rights reserved.
//

import UIKit

@IBDesignable
class CounterView: UIView {
    
    private struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 76
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 6 {
        didSet {
            if counter <= Constants.numberOfGlasses {
                setNeedsDisplay()
            }
        }
    }
    
    var startAngle: CGFloat = 3 * .pi / 4
    var endAngle: CGFloat = .pi / 4
    
    @IBInspectable var onlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.systemOrange

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        let path = startAngle != endAngle ? UIBezierPath(arcCenter: center, radius: radius/2 - Constants.arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true) : UIBezierPath(ovalIn: CGRect(x: Constants.arcWidth/2, y: Constants.arcWidth/2, width: radius - Constants.arcWidth, height: radius - Constants.arcWidth))
        
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
    }
    
    func increase() {
        if counter < 8 {
            endAngle += .pi / 4
            counter += 1
        }
    }
    
    func decrease() {
        if counter > 0 {
            endAngle -= .pi / 4
            counter -= 1
        }
    }

}
