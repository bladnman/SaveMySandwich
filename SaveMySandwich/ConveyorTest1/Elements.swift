//
//  Elements.swift
//  SaveMySandwich
//
//  Created by Matt Maher on 1/17/21.
//

import SpriteKit
import GameplayKit
import UIKit

extension ConveyorTest1Scene {

    
    func createTarget() {
        target = self.childNode(withName: "target") as? SKSpriteNode
        target?.physicsBody = SKPhysicsBody(circleOfRadius: target!.size.width/2)
        target?.physicsBody?.categoryBitMask = targetCategory
        target?.physicsBody?.affectedByGravity = false
        target?.physicsBody?.collisionBitMask = 0 // not affected by being hit
        target?.physicsBody?.contactTestBitMask = playerCategory
    }
    func createPlayer() {
        if let player = self.childNode(withName: "player") as? SKSpriteNode {
            player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
            player.physicsBody?.categoryBitMask = playerCategory
            player.physicsBody?.affectedByGravity = false
            player.physicsBody?.collisionBitMask = 0 // not affected by being hit
            player.physicsBody?.contactTestBitMask = conveyorCategory
            
            // CONSTRAIN THE PLAYER TO THE BOARD (ish)
            let playerWidth = player.size.width
            let playerHeight = player.size.height
            let playerWidth2 =  playerWidth / 2
            let playerHeight2 = playerHeight / 2
            let xRange = SKRange(lowerLimit: 0 + playerWidth2, upperLimit: size.width - playerWidth2)
            let yRange = SKRange(lowerLimit: 0 + playerHeight2 - playerHeight, upperLimit: size.height - playerHeight2 + playerHeight)
            player.constraints = [SKConstraint.positionX(xRange, y:yRange)]
            
            
            self.player = player
        }
    }
    func createConveyors() {
        for child in self.children {
            if child is ConveyorSpriteNode {
                let conveyor = child as! ConveyorSpriteNode
                
                // choose a velocity
                conveyor.velocity = CGFloat(CONVEYOR_SPEEDS.randomElement()!)
                
                conveyor.physicsBody = SKPhysicsBody(rectangleOf: conveyor.frame.size)
                conveyor.physicsBody?.categoryBitMask = conveyorCategory
                conveyor.physicsBody?.affectedByGravity = false
                conveyor.physicsBody?.collisionBitMask = 0
                conveyor.physicsBody?.contactTestBitMask = playerCategory
                
            }
        }

    }
    
    
    
    
    
    /*
     * SEE GameJoystick
     * for all things dealing with that
     */
    
}
