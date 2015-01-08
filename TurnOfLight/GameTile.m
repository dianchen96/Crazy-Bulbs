//
//  GameTile.m
//  TurnOfLight
//
//  Created by Dian Chen on 14-10-25.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import "GameTile.h"

NSString *onString = @"LightbulbOn";
NSString *offString = @"LightbulbOff";

@implementation GameTile


@synthesize isOn = _isOn;
@synthesize row = _row;
@synthesize col = _col;


-(id)initWithSize:(CGSize)size Row:(NSUInteger)row Col:(NSUInteger)col{
    if (self = [super init]) {
        self.isOn = YES;
        self.row = row;
        self.col = col;
        self.texture = [SKTexture textureWithImageNamed:onString];
        [self setSize:size];
    }
    
    return self;
}

-(void)flip {
    self.isOn = !self.isOn;
    if (self.isOn) {
        self.texture = [SKTexture textureWithImageNamed:onString];
    } else {
        self.texture = [SKTexture textureWithImageNamed:offString];
    }
}

@end
