//
//  UIImageExtension.swift
//  InstaClone
//
//  Created by Philip Martin on 28/04/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import UIKit

extension UIImage {
    
    func makeCircularImage(size: CGSize) -> UIImage {
        // make a CGRect with the image's size
        let circleRect = CGRect(origin: .zero, size: size)

        // begin the image context since we're not in a drawRect:
        UIGraphicsBeginImageContextWithOptions(circleRect.size, false, 0)

        // create a UIBezierPath circle
        let circle = UIBezierPath(roundedRect: circleRect, cornerRadius: circleRect.size.width * 0.5)

        // clip to the circle
        circle.addClip()

        UIColor.white.set()
        circle.fill()

        // draw the image in the circleRect *AFTER* the context is clipped
        self.draw(in: circleRect)

        // get an image from the image context
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()

        // end the image context since we're not in a drawRect:
        UIGraphicsEndImageContext()

        return roundedImage ?? self
    }
}
