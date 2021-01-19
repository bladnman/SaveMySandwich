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
    }
    func createPlayer() {
        player = self.childNode(withName: "player") as? SKSpriteNode
        player?.physicsBody = SKPhysicsBody(circleOfRadius: player!.size.width/2)
        player?.physicsBody?.categoryBitMask = playerCategory
        player?.physicsBody?.affectedByGravity = false
        player?.physicsBody?.collisionBitMask = 0 // not affected by being hit
    }
    
    /*
     * SEE GameJoystick
     * for all things dealing with that
     */
    
}
