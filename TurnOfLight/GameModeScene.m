//
//  GameModeScene.m
//  TurnOfLight
//
//  Created by Dian Chen on 14-11-2.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import "GameModeScene.h"
#import "GameButton.h"
#import "ClassicModeScene.h"
#import "LogicsScene.h"

@implementation GameModeScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /*Set the bulb icon*/
        SKSpriteNode *titleBulb = [SKSpriteNode spriteNodeWithImageNamed:@"LightbulbOff"];
        titleBulb.colorBlendFactor = 0.3;
        titleBulb.color = [UIColor clearColor];
        titleBulb.size = CGSizeMake(size.width/2, size.width/2);
        titleBulb.position = CGPointMake(0.5, size.width/3);
        /*Add action to the title bulb*/
        SKAction *bulbOn = [SKAction colorizeWithColor:[UIColor yellowColor] colorBlendFactor:0.35 duration:1.0];
        SKAction *bulbOff = [SKAction colorizeWithColor:[UIColor grayColor] colorBlendFactor:0.35 duration:1.0];
        [titleBulb runAction:[SKAction repeatActionForever:[SKAction sequence:@[bulbOn, bulbOff]]]];
        [self addChild:titleBulb];
        /*Set the title*/
        SKLabelNode *title = [SKLabelNode labelNodeWithFontNamed:@"SnellRoundhand-Black"];
        title.fontSize = size.width/7.5;
        title.text = @"Crazy Lights";
        title.position = CGPointMake(0, -size.width/12);
        [self addChild:title];
        
        /*Set the mode choosing buttons*/
        SKAction *timeModeAction = [SKAction runBlock:^{
            SKScene * gameScene = [[ClassicModeScene alloc] initWithSize:size length:2 hardness:1 newBgm:YES pastBGM:nil];
            SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
            [self.view presentScene:gameScene transition: reveal];
        }];
        GameButton *timeMode = [GameButton buttonWithColor:[UIColor clearColor] blend:0.3 size:CGSizeMake(size.width/2, size.width/8) Text:@"Start Game" textSize:size.width/14 action:timeModeAction];
        timeMode.position = CGPointMake(0.0, -80.0);
        [self addChild:timeMode];
        /*Hell Mode*/
//        SKAction *hellModeAction = [SKAction runBlock:^{
//            SKScene * gameScene = [[GameScene alloc] initWithSize:size length:2 hardness:1];
//            SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
//            [self.view presentScene:gameScene transition: reveal];
//        }];
//        GameButton *hellMode = [GameButton buttonWithColor:[UIColor clearColor] size: CGSizeMake(size.width/2, size.width/8) Text:@"Hell Mode" textSize:size.width/14 action:hellModeAction];
//        hellMode.position = CGPointMake(0.0, -80.0-size.height/7);
//        [self addChild:hellMode];
        /*Logistics Guide*/
        SKAction *logicsAction = [SKAction runBlock:^{
            SKScene * logicsScene = [[LogicsScene alloc] initWithSize:size];
            SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
            [self.view presentScene:logicsScene transition: reveal];
        }];
        GameButton *logics = [GameButton buttonWithColor:[UIColor yellowColor] blend:0.5 size:CGSizeMake(size.width/2, size.width/8) Text:@"Logistics" textSize:size.width/14 action:logicsAction];
        logics.position = CGPointMake(0.0, -80.0-size.height/7);
        [self addChild:logics];
        
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touch = [[touches anyObject] locationInNode:self];
    SKNode *touched = [self nodeAtPoint:touch];
    if ([touched isKindOfClass:[GameButton class]]) {
        GameButton *button = (GameButton *) touched;
        [button touch];
    }
}

@end
