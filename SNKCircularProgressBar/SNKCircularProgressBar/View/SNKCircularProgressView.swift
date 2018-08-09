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
    var radius: CGFloat!
    var thiknessShapeLayer: CGFloat!
    var thiknessProgressLayer: CGFloat!

    var progress: Float = 0 {
        willSet(newValue)
        {
            progressLayer.strokeEnd = CGFloat(newValue)
        }
    }
    
    @IBInspectable public var progressForegroundStrokeColor: UIColor? = nil {
        didSet {
            progressLayer.strokeColor = progressForegroundStrokeColor?.cgColor
        }
    }

    @IBInspectable public var progressBackgroundStrokeColor: UIColor? = nil {
        didSet {
            shapeLayer.strokeColor = progressBackgroundStrokeColor?.cgColor
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(frame: CGRect, radius: CGFloat, shapeLayerThikness: CGFloat, progressLayerThikness: CGFloat) {
        super.init(frame: frame)
        self.radius = radius
        self.thiknessShapeLayer = shapeLayerThikness
        self.thiknessProgressLayer = progressLayerThikness
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
        bgPath.addArc(withCenter: center, radius: self.radius, startAngle: CGFloat(0), endAngle: CGFloat(6.28), clockwise: true)
        bgPath.close()
    }
    
    private func createBackgroundShapelayer()
    {
        shapeLayer = CAShapeLayer()
        shapeLayer.path = bgPath.cgPath
        shapeLayer.lineWidth = self.thiknessShapeLayer
        shapeLayer.fillColor = nil
        
        self.layer.addSublayer(shapeLayer)
    }
    private func createForegroundProgressLayer()
    {
        progressLayer = CAShapeLayer()
        progressLayer.path = bgPath.cgPath
        progressLayer.lineCap = kCALineCapRound
        progressLayer.lineWidth = self.thiknessProgressLayer
        progressLayer.fillColor = nil
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
