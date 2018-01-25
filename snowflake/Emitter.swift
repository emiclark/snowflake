//
//  Emitter.swift
//  snowflake
//
//  Created by Emiko Clark on 1/5/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit
import QuartzCore

class Emitter {

    static func get(with image: UIImage, scale: CGFloat, velocity: CGFloat) -> CAEmitterLayer {
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterShape = kCAEmitterLayerLine
        print("imageSize: \(image.size.width), \(image.size.height) scale: \(scale), velocity: \(velocity)")

        emitterLayer.emitterCells = generateEmitterCells(with: image, scale: scale, velocity: velocity)
        return emitterLayer
    }

    static func generateEmitterCells(with image: UIImage, scale: CGFloat, velocity:CGFloat) -> [CAEmitterCell] {
        var cells = [CAEmitterCell]()
        
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.contentsScale = CGFloat(scale)
        cell.birthRate = 3
        
        cell.lifetime = 50
        cell.lifetimeRange = 0.25
        
        cell.velocity = CGFloat(velocity)

        cell.alphaSpeed = 0.2
        cell.alphaRange = 0.7
        
        cell.velocityRange = 20
        cell.yAcceleration = 30
        
        cell.spin = 1.5
        cell.spinRange = 1.2
        
//        cell.scale = scale
        cell.scale = 1
        cell.scaleRange = 0.5
        
        print("cellContentScale: \(cell.contentsScale), cellRectHeight: \(cell.contentsRect.height), cellScale: \(cell.scale), cellVelocity: \(cell.velocity)")
        
        // convert degrees to radians - make particles fall vertically down
        cell.emissionLongitude = (170 * (.pi/180))
        
        // define the particles to randomly fall within a cone of 45 degrees from the center instead of vertically straight down.
        cell.emissionRange = (45 * (.pi/180))
        
        cells.append(cell)
        
        return cells
    }
}
