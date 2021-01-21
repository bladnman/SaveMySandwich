//
//  ConveyorTest1Scene.swift
//  SaveMySandwich
//
//  Created by Matt Maher on 1/17/21.
//
import SpriteKit
import GameplayKit
import UIKit


class ConveyorTest1Scene: SKScene, SKPhysicsContactDelegate {
    
    var player:SKSpriteNode?
    var target:SKSpriteNode?
    
    // physics categories
    let playerCategory:UInt32 = 0x1 << 0
    let conveyorCategory:UInt32 = 0x1 << 1
    let wallCategory:UInt32 = 0x1 << 2
    let targetCategory:UInt32 = 0x1 << 4
    
    // joystick
    let jsMoveJoystick = 🕹(withDiameter: 120)
//    let jsRotateJoystick = TLAnalogJoystick(withDiameter: 120)
    let jsMoveSpeed = 0.2
    let jsIsMoveable = true
    
    // CONVEYOR
    let CONVEYOR_SPEEDS = [-200.0, -100.0, 0, 100, 200]
    
    
    // MARK: DID MOVE
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        createTarget()
        createPlayer()
        createConveyors()
        createJoystick()
    }
    
    
    // MARK: MOVES
    func handleJoysticMove(withVelocity velocity:CGPoint) {
        let speed = CGFloat(jsMoveSpeed)
        if let player = self.player {
            // add to current positions with stic velocty
            let newX = player.position.x + (velocity.x * speed)
            let newY = player.position.y + (velocity.y * speed)
            // set new position
            player.position = CGPoint(x: newX, y: newY )
        }

    }
    
    
    // MARK: TOUCHES
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let location = touch.previousLocation(in: self)
//            let node = self.nodes(at: location).first
//        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player?.removeAllActions()
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        player?.removeAllActions()
    }
    
    
    // MARK: PHYSICS
    func didBegin(_ contact: SKPhysicsContact) {
        var playerBody:SKPhysicsBody
        var otherBody:SKPhysicsBody

        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            playerBody = contact.bodyA
            otherBody = contact.bodyB
        } else {
            playerBody = contact.bodyB
            otherBody = contact.bodyA
        }
        
        if playerBody.categoryBitMask == playerCategory && otherBody.categoryBitMask == conveyorCategory {
            print("stepped on us")
            let conveyor = otherBody.node as! ConveyorSpriteNode
            self.player?.physicsBody?.velocity = CGVector(dx:0, dy: conveyor.velocity)
        }
    }
    func didEnd(_ contact: SKPhysicsContact) {
        var playerBody:SKPhysicsBody
        var otherBody:SKPhysicsBody

        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            playerBody = contact.bodyA
            otherBody = contact.bodyB
        } else {
            playerBody = contact.bodyB
            otherBody = contact.bodyA
        }
        
        if playerBody.categoryBitMask == playerCategory && otherBody.categoryBitMask == conveyorCategory {
            self.player?.physicsBody?.velocity = CGVector(dx:0, dy: 0.0)
        }
    }
    
    
    // MARK: UPDATE
    override func update(_ currentTime: TimeInterval) {
        if let player = self.player {
            // FAIL - exited play area
            if player.position.y > self.size.height || player.position.y < 0 {
//                self.run(SKAction.playSoundFileNamed("fail.wav", waitForCompletion: true))
                print("failed")
            }
        }
    }
}
