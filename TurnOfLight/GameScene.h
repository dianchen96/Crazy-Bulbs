//
//  GameScene.h
//  TurnOfLight
//
//  Created by Dian Chen on 14-10-30.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TOLScene.h"

#define ONGOING 0
#define WON 1
#define LOSE 2

@class GameGrids;

@interface GameScene : TOLScene

@property(strong, nonatomic) GameGrids *game;
@property(strong, nonatomic) SKSpriteNode *loseMask;
@property(assign, nonatomic) NSUInteger length;
@property(assign, nonatomic) NSUInteger hardness;
@property(assign, nonatomic) NSUInteger gameState;
@property(assign, nonatomic) NSUInteger level;


@property(strong, nonatomic)AVAudioPlayer *backgroundMusicPlayer;

-(id)initWithSize:(CGSize)size length:(NSUInteger)length hardness:(NSUInteger)hardness newBgm:(BOOL)newBgm pastBGM:(AVAudioPlayer*)player;

@end
