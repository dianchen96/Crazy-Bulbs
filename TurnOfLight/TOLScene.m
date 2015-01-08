//
//  TOLScene.m
//  TurnOfLight
//
//  Created by Dian Chen on 14-11-2.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import "TOLScene.h"

@implementation TOLScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.anchorPoint = CGPointMake(0.5, 0.5);
        /*Set the BackGround*/
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"BackGroundX"];
        [background setSize:size];
        [self addChild:background];
        
        /*Set name tag*/
        SKLabelNode *name = [SKLabelNode labelNodeWithText:@"presented by Dian Chen"];
        name.fontSize = size.width/24;
        name.position = CGPointMake(-size.width/3.6, -size.height/2);
        [self addChild:name];
        
    }
    return self;
}

@end
