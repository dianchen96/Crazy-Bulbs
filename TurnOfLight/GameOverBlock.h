//
//  GameOverBlock.h
//  TurnOfLight
//
//  Created by Dian Chen on 14-11-6.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameOverBlock : SKSpriteNode

-(id)initWithSize:(CGSize)size mode:(NSString*)mode level:(NSUInteger)level won:(BOOL)won;

+(id)overBlockWithSize:(CGSize)size mode:(NSString*)mode level:(NSUInteger) level won:(BOOL)won;

@end
