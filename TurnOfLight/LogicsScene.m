//
//  LogicsScene.m
//  Crazy Lights
//
//  Created by Dian Chen on 14-11-14.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import "LogicsScene.h"
#import "GameModeScene.h"

@implementation LogicsScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /*Set the Zone*/
        self.anchorPoint = CGPointMake(0.5, 0.5);
        SKSpriteNode *zone = [SKSpriteNode spriteNodeWithImageNamed:@"Zone"];
        CGFloat zoneWidth = size.width*6/7;
        CGFloat zoneHeight = size.height*2/7;
        [zone setSize:CGSizeMake(zoneWidth, zoneHeight)];
        [self addChild:zone];
        /*Set the Words*/
        SKLabelNode *try = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        try.text = @"Just try to turn ON all the lights!";
        try.fontSize = size.width/24;
        try.position = CGPointMake(0.5, size.width/10);
        [self addChild:try];
        SKLabelNode *smile = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        smile.text = @"Touch to go back...";
        smile.fontSize = size.width/24;
        smile.position = CGPointMake(0.5, -size.width/8);
        [self addChild:smile];
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    SKScene *gameModeScene = [[GameModeScene alloc] initWithSize:self.size];
    SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
    [self.view presentScene:gameModeScene transition: reveal];
}

@end
