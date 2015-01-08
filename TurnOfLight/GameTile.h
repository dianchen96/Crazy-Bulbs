//
//  GameTile.h
//  TurnOfLight
//
//  Created by Dian Chen on 14-10-25.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameTile : SKSpriteNode

@property(assign, nonatomic) BOOL isOn;
@property(assign, nonatomic) NSUInteger row;
@property(assign, nonatomic) NSUInteger col;

-(id)initWithSize:(CGSize)size Row:(NSUInteger)row Col:(NSUInteger)col;
-(void)flip;



@end
