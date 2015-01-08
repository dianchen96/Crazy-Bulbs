//
//  ClassicModeScene.m
//  TurnOfLight
//
//  Created by Dian Chen on 14-11-3.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import "ClassicModeScene.h"
#import "GameModeScene.h"
#import "GameOverBlock.h"

NSUInteger timeLeft = 30;


@implementation ClassicModeScene

-(id)initWithSize:(CGSize)size length:(NSUInteger)length hardness:(NSUInteger)hardness newBgm:(BOOL)newBgm pastBGM:(AVAudioPlayer *)player {
    if (self = [super initWithSize:size length:length hardness:hardness newBgm:newBgm pastBGM:player]) {
        self.timeLeft = timeLeft+length*length+hardness-5;
        self.timer = [SKLabelNode labelNodeWithFontNamed:@"ChalkboardSE-Bold"];
        self.timer.text = [NSString stringWithFormat:@"Time: %lu", (unsigned long)self.timeLeft];
        self.timer.fontSize = 25.0;
        self.timer.position = CGPointMake(size.width/3-5.0, size.height/3+30.0);
        /*Set the Timer Action*/
        SKAction *wait = [SKAction waitForDuration:1.0];
        SKAction *countdown = [SKAction runBlock:^{
            if (self.timeLeft == 0 && self.gameState == ONGOING) {
                //The game loses
                self.gameState = LOSE;
                [self.loseMask runAction:[SKAction colorizeWithColor:[UIColor blackColor] colorBlendFactor:0.5 duration:10.0]];
                [self addChild:[GameOverBlock overBlockWithSize:self.size mode:@"Classic" level:self.level won:NO]];
                [self.backgroundMusicPlayer stop];
                [self runAction:[SKAction playSoundFileNamed:@"fail.wav" waitForCompletion:YES]];
            } else if (self.gameState != ONGOING) {
                return;
            }
            else {
                self.timeLeft--;
                self.timer.text = [NSString stringWithFormat:@"Time: %lu", (unsigned long)self.timeLeft];
            }
        }];
        [self.timer runAction:[SKAction repeatActionForever:[SKAction sequence:@[wait, countdown]]]];
        [self addChild:self.timer];
    }
    
    return self;
}

//Override the touchBegan to implement overScene
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.gameState == ONGOING) {
        /*If the Game is Ongoing*/
        [super touchesBegan:touches withEvent:event];
    } else if (self.gameState == WON) {
        /*If the Game Won*/
        NSUInteger newLength;
        NSUInteger newHardness;
        if (self.hardness == self.length*self.length -1) {
            newLength = self.length + 1;
            newHardness = 1;
        } else {
            newLength = self.length;
            newHardness = self.hardness + 1;
        }
        [self.backgroundMusicPlayer pause];
        SKScene * newGameScene = [[ClassicModeScene alloc] initWithSize:self.size length:newLength hardness:newHardness newBgm:NO pastBGM:self.backgroundMusicPlayer];
        SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
        [self.view presentScene:newGameScene transition: reveal];
    } else {
        /*If the Game Lose*/
        SKScene * gameModeScene = [[GameModeScene alloc] initWithSize:self.size];
        SKTransition *reveal = [SKTransition fadeWithDuration:1.0];
        [self.view presentScene:gameModeScene transition: reveal];
    }
}


@end
