//
//  GameMove.h
//  TurnOfLight
//
//  Created by Dian Chen on 14-10-30.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameMove : NSObject

@property(assign, nonatomic) NSUInteger row;
@property(assign, nonatomic) NSUInteger col;

-(id)initWithRow:(NSUInteger)row Col:(NSUInteger)col;
-(BOOL)equals:(NSUInteger)row col:(NSUInteger)col;

@end
