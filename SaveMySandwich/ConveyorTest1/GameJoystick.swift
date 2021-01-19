//
//  GameJoystick.swift
//  SaveMySandwich
//
//  Created by Matt Maher on 1/18/21.
//

import SpriteKit
import GameplayKit
import UIKit

extension ConveyorTest1Scene {
    func createJoystick() {
        _setUpMoveJoystick()
//        _setUpRotateJoystick()
    }
    func _setUpMoveJoystick() {
        let jsTouchArea = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        let moveJoystickHiddenArea = TLAnalogJoystickHiddenArea(rect: jsTouchArea)
        moveJoystickHiddenArea.joystick = jsMoveJoystick
        addChild(moveJoystickHiddenArea)
        print(moveJoystickHiddenArea.lineWidth)
        jsMoveJoystick.isMoveable = jsIsMoveable
        
        //MARK: Move Handlers
//        moveJoystick.on(.begin) { [unowned self] _ in
//            // work here
//        }
        
        jsMoveJoystick.on(.move) { [unowned self] joystick in
            guard let player = self.player else {
                return
            }
            
            let pVelocity = joystick.velocity;
            let speed = CGFloat(jsMoveSpeed)
            
            player.position = CGPoint(x: player.position.x + (pVelocity.x * speed), y: player.position.y + (pVelocity.y * speed))
        }
        
//        moveJoystick.on(.end) { [unowned self] _ in
//            // work here
//        }

    }
    func _setUpRotateJoystick(isMoveable:Bool=true) {
        let rotateJoystickHiddenArea = TLAnalogJoystickHiddenArea(rect: CGRect(x: frame.midX, y: 0, width: frame.midX, height: frame.height))
        rotateJoystickHiddenArea.joystick = jsRotateJoystick
        addChild(rotateJoystickHiddenArea)
        
        //MARK: Rotate Handlers
        jsRotateJoystick.on(.move) { [unowned self] joystick in
            guard let player = self.player else {
                return
            }

            player.zRotation = joystick.angular
        }
        
        jsRotateJoystick.on(.end) { [unowned self] _ in
            self.player?.run(SKAction.rotate(byAngle: 3.6, duration: 0.5))
        }
        
    }
}
