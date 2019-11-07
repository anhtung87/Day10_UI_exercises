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
    
    // gom các hằng số thành 1 struct duy nhất, thuận tiện cho việc quản lý biến.
    private struct Constants {
        // số phần chia của vòng tròn
        static let numberOfGlasses = 8
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 76
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    // biến số đếm số lượng phần chia vòng tròn sẽ được xuất hiện trên screen
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
        
        let arc = UIBezierPath(
            arcCenter: center,
            radius: radius/2 - Constants.arcWidth/2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )
        let circle = UIBezierPath(
            ovalIn: CGRect(
                x: Constants.arcWidth/2,
                y: Constants.arcWidth/2,
                width: radius - Constants.arcWidth,
                height: radius - Constants.arcWidth
            )
        )
        let path = startAngle != endAngle ? arc : circle
        
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
