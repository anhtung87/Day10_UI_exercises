//
//  plusButton.swift
//  Day10_UI_exercises
//
//  Created by Hoang Tung on 11/3/19.
//  Copyright © 2019 Hoang Tung. All rights reserved.
//

import UIKit

@IBDesignable
class plusButton: UIButton {

    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHight: CGFloat {
        return bounds.height / 2
    }
    
    let plusButtonScale: CGFloat = 0.6
    
    @IBInspectable var plusLineWidth: CGFloat = 5.0
    @IBInspectable var fillColor: UIColor = UIColor.systemRed
    @IBInspectable var isAddButton: Bool = true
    
    override func draw(_ rect: CGRect) {
        // Vẽ hình dạng của button và tô màu cho button.
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        // thiết lập chiều rộng và chiều cao cho nét (stroke) ngang.
        // so sánh chiều rộng và chiều cao của button, lấy giá trị nhỏ hơn nhân với tỷ lệ
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        // khai báo 1 đường dẫn
        let plusPath = UIBezierPath()
        
        // dặt độ rộng và độ cao cho đường dẫn
        plusPath.lineWidth = plusLineWidth
        
        // dịch chuyển điểm bắt đầu của đường dẫn
        // bắt đầu vẽ đường ngang
        plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth, y: halfHight))
        
        // vẽ đến điểm tiếp theo
        plusPath.addLine(to: CGPoint(x: halfWidth + halfPlusWidth, y: halfHight))
        
        // Tô màu cho đường vẽ
        UIColor.white.setStroke()
        plusPath.stroke()
        
        if isAddButton {
            plusPath.move(to: CGPoint(x: halfWidth, y: halfHight - halfPlusWidth))
            plusPath.addLine(to: CGPoint(x: halfWidth, y: halfHight + halfPlusWidth))
            plusPath.stroke()
        }
    }
}
