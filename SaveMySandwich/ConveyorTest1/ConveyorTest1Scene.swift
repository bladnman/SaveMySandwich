//
//  ConveyorTest1Scene.swift
//  SaveMySandwich
//
//  Created by Matt Maher on 1/17/21.
//
import SpriteKit
import GameplayKit
import UIKit


class ConveyorTest1Scene: SKScene {
    
    var player:SKSpriteNode?
    var target:SKSpriteNode?
    
    // physics categories
    let playerCategory:UInt32 = 0x1 << 0
    let conveyorCategory:UInt32 = 0x1 << 1
    let targetCategory:UInt32 = 0x1 << 2
    
    let jsMoveJoystick = 🕹(withDiameter: 120)
    let jsRotateJoystick = TLAnalogJoystick(withDiameter: 120)
    let jsMoveSpeed = 0.2
    let jsIsMoveable = true
    
    // MARK: DID MOVE
    override func didMove(to view: SKView) {
        createTarget()
        createPlayer()
        createJoystick()
        
    }
    
    // MARK: TOUCHES
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.previousLocation(in: self)
            let node = self.nodes(at: location).first
            
            if node?.name == "right" {
//                moveToNextTrack()
            } else if node?.name == "up" {
//                moveVertically(up: true)
            } else if node?.name == "down" {
//                moveVertically(up: false)
            } else if node?.name == "pause" {
                if let scene = self.scene {
                    scene.isPaused = !scene.isPaused
                }
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player?.removeAllActions()
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        player?.removeAllActions()
    }
    
    
    // MARK: UPDATE
    override func update(_ currentTime: TimeInterval) {
        // tbd
    }
}
