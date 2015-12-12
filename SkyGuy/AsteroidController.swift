//
//  AsteroidController.swift
//  SkyGuy
//
//  Created by Surudh Bhutani on 2015-06-27.
//  Copyright (c) 2015 Surudh Bhutani. All rights reserved.
//

import Foundation
import SpriteKit
import Darwin

class AsteroidSpriteController {
    var asteroidSprites: [SKSpriteNode]  = []
    
    
    func spawnAsteroid(targetSprite: SKSpriteNode, scene: SKScene) -> SKSpriteNode {
       
        // create a new enemy sprite
        let newAsteroid = SKSpriteNode(imageNamed:"Asteroid")
        asteroidSprites.append(newAsteroid)
        newAsteroid.xScale = 0.5
        newAsteroid.yScale = 0.5
        
        // position new sprite at a random position on the screen
        var sizeRect = UIScreen.mainScreen().applicationFrame;
        let posX = scene.frame.maxX
        let posY = arc4random_uniform(UInt32(scene.frame.maxY + 50))
        newAsteroid.position = CGPoint(x: CGFloat(posX), y: CGFloat(posY))
        
        /*
        for(var i = 0; i < asteroidSprites.count; i++) {
            while(newAsteroid.frame.contains(asteroidSprites[i].frame)) {
                var posY = arc4random_uniform(UInt32(scene.frame.maxY + 50))
            }
        }
        */
       
        //determine how and where asteroids will spawn
        
        
        
        
        
        
        
        
        // Define Constraints for orientation/targeting behavior


        
/*
        let i = asteroidSprites.count-1
        let rangeForOrientation = SKRange(constantValue:CGFloat(M_2_PI*7))
        let orientConstraint = SKConstraint.orientToNode(targetSprite, offset: rangeForOrientation)
        let rangeToSprite = SKRange(lowerLimit: targetSprite.frame.midX + 1000, upperLimit: targetSprite.frame.midX + 10000)
        var distanceConstraint: SKConstraint

        */
        // First enemy has to follow spriteToFollow, second enemy has to follow first enemy, ...

     //   if asteroidSprites.count-1 == 0 {
        
        
        
            //distanceConstraint = SKConstraint.distance(rangeToSprite, toNode: targetSprite)
       // } else {
         //   distanceConstraint = SKConstraint.distance(rangeToSprite, toNode: asteroidSprites[i-1])
       // }

     //   newAsteroid.constraints = [orientConstraint, distanceConstraint]
        
        return newAsteroid

    }
    
    func moveTowardsShip(targetSprite: SKSpriteNode, scene: SKScene) {
        
        //generate random offsets for y positioning
        //make sure to go back and forth if you have to
        
        for(var i = 0; i < asteroidSprites.count; i++) {
            
            asteroidSprites[i].position.x += (scene.frame.minX)/700
         //   asteroidSprites[i].position.y += (-scene.frame.midY)/7000
            
            /*
            if(asteroidSprites[i].position.y >= scene.frame.midY) {
                asteroidSprites[i].position.y +=  (-scene.frame.midY)/7000 - CGFloat(arc4random_uniform(200))/7000
            } else {
                asteroidSprites[i].position.y += CGFloat(arc4random_uniform(200))/7000 + (scene.frame.midY)/7000
            }
*/
        }
    }
    
}











