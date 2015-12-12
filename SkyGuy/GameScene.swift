//
//  GameScene.swift
//  SkyGuy
//
//  Created by Surudh Bhutani on 2015-06-26.
//  Copyright (c) 2015 Surudh Bhutani. All rights reserved.
//

//Idea: update game scene to make a lander game
//spaceship lander game
//check out the physics kit
//moon lander sounds good
//score dependent on how close to the target the center of the ship lands
//targets get smaller and possibly debris exists or limited fuel


import SpriteKit
import Darwin

class GameScene: SKScene {
    
    let ship = SKSpriteNode(imageNamed:"Spaceship")
   // let joystick = SKSpriteNode(imageNamed: "Joystick")
    let base = SKSpriteNode(imageNamed: "Base")
    let up = SKSpriteNode(imageNamed: "up button")
    let down = SKSpriteNode(imageNamed: "down button")
    let fireLaser = SKSpriteNode(imageNamed: "FireLaser")
    let laser = SKSpriteNode(imageNamed: "greenLaser")
    //let background = SKSpriteNode(imageNamed: "Background")
    let backgroundVelocity : CGFloat = 50.0
    
    var joyStickMoved:Bool = false
    var upButtonTouched:Bool = false
    var downButtonTouched:Bool = false
    var laserFired:Bool = false
    var alternator:Int  = 0
    
    var asteroidController = AsteroidSpriteController()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
/*
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
*/
      //  background.zPosition = -10
       // self.addChild(background)
        
        ship.xScale = 0.3
        ship.yScale = 0.3
        
        //self.addChild(background)
        self.backgroundColor = SKColor.blackColor()
        self.initializeMovingBackground()
        //self.backgroundColor = UIColor(patternImage: UIImage(named:"Background.png")!)
        self.anchorPoint = CGPointMake(0.5, 0.5)
        
        
        self.addChild(ship)
        ship.position = CGPointMake(100+CGRectGetMinX(self.frame), 100+CGRectGetMidY(self.frame))
        ship.zRotation = 4.71238898
        
        
        /*
        joystick.xScale = 0.23
        joystick.yScale = 0.23
        self.addChild(joystick)
        joystick.position = CGPointMake(self.frame.minX + 90, self.frame.minY + 185)
        */
        
        self.addChild(up)
        up.xScale = 0.12
        up.yScale = 0.12
        up.position = CGPointMake(self.frame.minX + 70, self.frame.minY + 185)
        
        
        self.addChild(down)
        down.xScale = 0.2
        down.yScale = 0.2
        down.position = CGPointMake(self.frame.minX + 70, self.frame.minY + 135)
        
        self.addChild(fireLaser)
        fireLaser.xScale = 0.15
        fireLaser.yScale = 0.15
        fireLaser.position = CGPointMake(self.frame.maxX - 60, self.frame.minY + 160)
        
 
    
        for(var i=0; i<3;i++){
            self.addChild(asteroidController.spawnAsteroid(ship, scene: self))
            
        }
        
        
       /*
        self.addChild(base)
        base.position = joystick.position
        base.xScale = 0.15
        base.yScale = 0.15
        
*/
       // joystick.alpha = 0.3
        up.alpha = 0.3
        down.alpha = 0.3
        fireLaser.alpha = 0.3
      //  base.alpha = 0
        
    }
    
    func initializeMovingBackground() {
        for var index = 0; index < 2; ++index {
            let bg = SKSpriteNode(imageNamed: "Background.png")
            bg.position = CGPoint(x: index * Int(bg.size.width), y: 0)
            bg.anchorPoint = CGPointZero
            bg.name = "background"
            self.addChild(bg)
        }
    }
    

    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        for touch in (touches ) {
            let touchLocation = touch.locationInNode(self)
        
            if(CGRectContainsPoint(up.frame, touchLocation)) {
                upButtonTouched = true
            } else {
                upButtonTouched = false
                
                
                //evaluated for each touch, touching inside and outside
                //if this statement wasn't here, then touching inside and then touching outside would make joystick move
                //so update joystick for each touch everywhere
            }
            
            if(CGRectContainsPoint(down.frame, touchLocation)) {
                downButtonTouched = true
            } else {
                downButtonTouched = false
            }
           // self.moveShip()
            
            if(CGRectContainsPoint(fireLaser.frame, touchLocation)) {
                laserFired = true
            }
         

            //self.
            
            
        }
    }
    
    //for a rotating joystick

    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch dragged */
        for touch in (touches ) {
            /*
            if (joyStickMoved) {
            let touchLocation = touch.locationInNode(self)
            let vector = CGVector(dx: touchLocation.x - base.position.x, dy: touchLocation.y - base.position.y)
            let radAngle = atan2(vector.dy, vector.dx)
            let degAngle = radAngle*CGFloat(180/M_PI)
           // println(degAngle + 180)
            
            let length:CGFloat = base.frame.size.height / 2
            
            let xDist:CGFloat = sin(radAngle - 1.57079633) * length
            let yDist:CGFloat = cos(radAngle - 1.57079633) * length

            
                if(CGRectContainsPoint(base.frame,touchLocation)) {
                    joystick.position = touchLocation
                } else {
                    joystick.position = CGPointMake(base.position.x - xDist, base.position.y + yDist)
                }
                ship.zRotation = radAngle - 1.57079633
                
                //add logic for movement
         //       if(ship.position.x - xDist < ) {
                    
          //      }
                
                
                //glitchy because it only changes when there is a change in joystick
                //need to keep ship moving even if net joystick hasn't changed
                
                moveShip()

                println(ship.position)
            }
*/
        }
    }

    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        /*
        if(upButtonTouched || downButtonTouched) {
            let move:SKAction = SKAction.moveTo(base.position, duration: 0.1)
            move.timingMode = .EaseOut
            joystick.runAction(move)
        }
    

*/
            upButtonTouched = false
            downButtonTouched = false
        
            self.fireShipLasers()
           // self.fireShipLasers()
            laserFired = false
        

        
        
    
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
       // if(upButtonTouched || downButtonTouched) {
       //     self.moveShip()
       // }
        
        alternator++
        
        self.moveBackground()
        self.moveShip()
       // self.fireShipLasers()
        if(alternator % 200 == 0) {
            self.addChild(asteroidController.spawnAsteroid(ship, scene: self))
        }

            for(var i=0; i<asteroidController.asteroidSprites.count;i++){
                asteroidController.moveTowardsShip(ship, scene: self)
        }

    }
    
    func moveShip() {
        
        if(upButtonTouched) {
            ship.position.y = ship.position.y + self.frame.maxX/70
        } else if(downButtonTouched) {
            ship.position.y = ship.position.y - self.frame.maxX/70
        }
        
        
        
      //  ship.position.x = ship.position.x + (joystick.position.x - base.position.x) / 20
      //  ship.position.y = ship.position.y + (joystick.position.y - base.position.y) / 20
        
        //update this to make a smooth transition from the other side -- like snake
       /* 
        if(outOfBounds()) {
            ship.position.x = self.frame.midX
            ship.position.y = self.frame.midY
        }
        */
    }
    
    func outOfBounds() -> Bool {
        //if ship's CGRECT is outside the frame, then return true
        let shipRect1:CGRect = CGRectMake(ship.frame.minX, ship.frame.minY, ship.frame.maxX - ship.frame.minX, ship.frame.maxY - ship.frame.minY)
        let shipRect2:CGRect = CGRectMake(ship.frame.maxX, ship.frame.maxY, ship.frame.minX - ship.frame.maxX, ship.frame.minY - ship.frame.maxY)
        if(!self.frame.contains(shipRect1) || !self.frame.contains(shipRect2)) {
            return true
        }
        return false
    }
    
    func moveBackground() {
        
        self.enumerateChildNodesWithName("background", usingBlock: { (node, stop) -> Void in
            if let bg = node as? SKSpriteNode {
                bg.position = CGPoint(x: bg.position.x - self.backgroundVelocity, y: self.frame.midY - 250)
                
                // Checks if bg node is completely scrolled off the screen, if yes, then puts it at the end of the other node.
                if bg.position.x <= 4.5 * self.frame.minX  {
                    bg.position = CGPointMake(bg.position.x + bg.size.width * 2, bg.position.y)
                }
            }
        })
    }
    
    func fireLaser(newLaser: SKSpriteNode, toDestination destination:CGPoint, withDuration duration:CFTimeInterval) {
        
        self.removeFromParent()
        
        // 1
        let laserAction = SKAction.sequence([SKAction.moveTo(destination, duration: duration), SKAction.waitForDuration(3.0/60.0), SKAction.removeFromParent()])
        
        // 2
       // let soundAction = SKAction.playSoundFileNamed(soundName, waitForCompletion: true)
        
        // 3
        newLaser.runAction(SKAction.group([laserAction]))
        
        // 4
        self.addChild(newLaser)
    }
    
    func fireShipLasers() {
        
    //    alternator++
        
       // let  = self.childNodeWithName(kShipFiredBulletName)
        
        // 1
      //  if existingBullet == nil {
            
       //     if let ship = self.childNodeWithName(kShipName) {
                
          //      if let bullet = self.makeBulletOfType(.ShipFired) {
        if(laserFired) {
            let newLaser:SKSpriteNode = SKSpriteNode(imageNamed: "greenLaser")
            newLaser.xScale = 0.15
            newLaser.yScale = 0.15
            
            // 2
            if(alternator%2 == 0) {
                newLaser.position = CGPoint(x: ship.position.x + 50, y: ship.position.y + 10)
            } else {
                newLaser.position = CGPoint(x: ship.position.x + 50, y: ship.position.y - 10)
            }
           
            
            // 3
            let laserDestination = CGPoint(x: self.frame.maxX, y: newLaser.position.y)
            // 4
            self.fireLaser(newLaser, toDestination: laserDestination, withDuration: 1.0)
            
        }
        
    //            }
      //      }
        }
    
    
    }


