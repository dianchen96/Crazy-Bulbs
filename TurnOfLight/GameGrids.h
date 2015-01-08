//
//  GameGrids.h
//  TurnOfLight
//
//  Created by Dian Chen on 14-10-30.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GameTile;

@interface GameGrids : NSObject

@property(assign, nonatomic) NSUInteger hardness;
@property(assign, nonatomic) NSUInteger length;
@property(strong, nonatomic) NSMutableArray *tiles;
@property(strong, nonatomic) NSMutableArray *moves;

-(id)initWithLength:(NSUInteger)length tileSize:(CGSize)tileSize;
-(id)initWithLength:(NSUInteger)length hardness:(NSUInteger)hardness tileSize:(CGSize)tileSize;

-(GameTile*)tileAtRow:(NSUInteger)row Col:(NSUInteger)col;
-(void)flipAtRow:(NSUInteger)row Col:(NSUInteger)col;

-(bool)checkDone;

//-(void)show;

@end
