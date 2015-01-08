//
//  GameGrids.m
//  TurnOfLight
//
//  Created by Dian Chen on 14-10-30.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import "GameGrids.h"
#import "GameTile.h"
#import "GameMove.h"

@implementation GameGrids

@synthesize tiles = _tiles;
@synthesize moves = _moves;

-(id)initWithLength:(NSUInteger)length tileSize:(CGSize)tileSize {
    if (self = [super init]) {
        self.length = length;
        self.tiles = [NSMutableArray arrayWithCapacity:length];
        for (NSUInteger i = 0; i < length; i++) {
            NSMutableArray *rows = [NSMutableArray arrayWithCapacity:length];
            for (NSUInteger j = 0; j < length; j++) {
                GameTile *tile = [[GameTile alloc] initWithSize:tileSize Row:i Col:j];
                [rows addObject:tile];
            }
            [self.tiles addObject:rows];
        }
    }
    
    return self;
}

-(id)initWithLength:(NSUInteger)length hardness:(NSUInteger)hardness tileSize:(CGSize)tileSize {
    if (self = [self initWithLength:length tileSize:tileSize]) {
        NSUInteger row;
        NSUInteger col;
        for (NSUInteger i = 0; i < hardness; i++) {
            row = arc4random()%length;
            col = arc4random()%length;
            [self flipAtRow:row Col:col];
            [self.moves addObject:[[GameMove alloc] initWithRow:row Col:col]];
        }
    }
    
    return self;
}

-(GameTile*)tileAtRow:(NSUInteger)row Col:(NSUInteger)col {
    return [[self.tiles objectAtIndex:row] objectAtIndex:col];
}

-(BOOL)inSolves:(NSUInteger)row col:(NSUInteger)col {
    for (GameMove *move in self.moves) {
        if ([move equals:row col:col]) {
            return YES;
        }
    }
    return NO;
}

-(void)flipAtRow:(NSUInteger)row Col:(NSUInteger)col {
    if (row > 0) {
        [[self tileAtRow:row-1 Col:col] flip];
    }
    if (row < self.length-1) {
        [[self tileAtRow:row+1 Col:col] flip];
    }
    if (col > 0) {
        [[self tileAtRow:row Col:col-1] flip];
    }
    if (col < self.length-1) {
        [[self tileAtRow:row Col:col+1] flip];
    }
    [[self tileAtRow:row Col:col] flip];
}

-(bool)checkDone {
    for (NSUInteger i = 0; i < self.length; i++) {
        for (NSUInteger j = 0; j < self.length; j++) {
            if (![self tileAtRow:i Col:j].isOn) {
                return NO;
            }
        }
    }
    return YES;
}

//-(void)show{
//    for (NSUInteger i = 0; i < self.length; i++) {
//        NSString *row = @"";
//        for (NSUInteger j = 0; j < self.length; j++) {
//            row = [row stringByAppendingFormat:@" %d", [self tileAtRow:i Col:j].isOn];
//        }
//        NSLog(@"%@", row);
//    }
//}

@end
