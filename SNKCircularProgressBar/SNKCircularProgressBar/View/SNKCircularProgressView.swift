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
            //observes for change in value of progress variable and set the new value to it here.
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
        
    }
    private func createForegroundProgressLayer()
    {
        
    }

    func initCircularProgressBar()
    {
        createCirclePath()
        createBackgroundShapelayer()
        createForegroundProgressLayer()
    }

}
