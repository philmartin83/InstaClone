//
//  ASNetworkImage+Downsampling.swift
//  InstaClone
//
//  Created by Philip Martin on 29/03/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

extension ASNetworkImageNode {
    
    func downsample(imageAt imageURL: URL, to pointSize: CGSize, scale: CGFloat) {
        DispatchQueue.global(qos: .background).async {
            let imageSourceOptions = [kCGImageSourceShouldCache: true] as CFDictionary
            let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions)!
            
            let maxDimentionInPixels = max(pointSize.width, pointSize.height) * scale
            
            let downsampledOptions = [kCGImageSourceCreateThumbnailFromImageAlways: true,
                                      kCGImageSourceShouldCacheImmediately: true,
                                      kCGImageSourceCreateThumbnailWithTransform: true,
                                      kCGImageSourceThumbnailMaxPixelSize: maxDimentionInPixels] as CFDictionary
            let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampledOptions)
            if let downsampled = downsampledImage {
                self.image = UIImage(cgImage: downsampled)
            } else {
                self.url = imageURL
            }
        }
    }
}
