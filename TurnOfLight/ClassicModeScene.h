//
//  ClassicModeScene.h
//  TurnOfLight
//
//  Created by Dian Chen on 14-11-3.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"

@interface ClassicModeScene : GameScene

@property(strong, nonatomic) SKLabelNode *timer;
@property(assign, nonatomic) NSUInteger timeLeft;

@end
