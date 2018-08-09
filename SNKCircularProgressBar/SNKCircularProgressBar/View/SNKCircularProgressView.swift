//
//  SNKCircularProgressView.swift
//  SNKCircularProgressBar
//
//  Created by Norace Kumar on 8/9/18.
//  Copyright © 2018 SNK. All rights reserved.
//

import UIKit

class SNKCircularProgressView: UIView {

    var bgPath: UIBezierPath!
    var shapeLayer: CAShapeLayer!       // Background layer
    var progressLayer: CAShapeLayer!    // Foreground layer

    var progress: Float = 0 {
        willSet(newValue)
        {
            progressLayer.strokeEnd = CGFloat(newValue)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        bgPath = UIBezierPath()
        self.initCircularProgressBar()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        bgPath = UIBezierPath()
        self.initCircularProgressBar()
    }

    private func createCirclePath()
    {
        //Draw circle
        let x = self.frame.width/2
        let y = self.frame.height/2
        let center = CGPoint(x: x, y: y)
        print(x,y,center)
        bgPath.addArc(withCenter: center, radius: x/CGFloat(2), startAngle: CGFloat(0), endAngle: CGFloat(6.28), clockwise: true)
        bgPath.close()
    }
    
    private func createBackgroundShapelayer()
    {
        shapeLayer = CAShapeLayer()
        shapeLayer.path = bgPath.cgPath
        shapeLayer.lineWidth = 15
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        
        self.layer.addSublayer(shapeLayer)
    }
    private func createForegroundProgressLayer()
    {
        progressLayer = CAShapeLayer()
        progressLayer.path = bgPath.cgPath
        progressLayer.lineCap = kCALineCapRound
        progressLayer.lineWidth = 15
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.red.cgColor
        progressLayer.strokeEnd = 0.0
        
        self.layer.addSublayer(progressLayer)
    }

    func initCircularProgressBar()
    {
        createCirclePath()
        createBackgroundShapelayer()
        createForegroundProgressLayer()
    }

}
