//
//  GameMove.m
//  TurnOfLight
//
//  Created by Dian Chen on 14-10-30.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import "GameMove.h"

@implementation GameMove

@synthesize row = _row;
@synthesize col = _col;

-(id)initWithRow:(NSUInteger)row Col:(NSUInteger)col {
    if (self = [super init]) {
        self.row = row;
        self.col = col;
    }
    return self;
}

-(BOOL)equals:(NSUInteger)row col:(NSUInteger)col {
    return self.row == row && self.col == col;
}

@end
