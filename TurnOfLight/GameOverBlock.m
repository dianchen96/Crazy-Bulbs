//
//  GameOverBlock.m
//  TurnOfLight
//
//  Created by Dian Chen on 14-11-6.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import "GameOverBlock.h"

NSString *blockName = @"Zone";

@implementation GameOverBlock

-(id)initWithSize:(CGSize)size mode:(NSString *)mode level:(NSUInteger)level won:(BOOL)won {
    if (self = [super initWithTexture:[SKTexture textureWithImageNamed:blockName]]) {
        self.anchorPoint = CGPointMake(0.5, 0.5);
        self.size = CGSizeMake(size.width*2, size.height*2);
        self.colorBlendFactor = 0.7;
        self.color = [UIColor clearColor];
        SKLabelNode *title = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        SKLabelNode *you = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        you.fontSize = size.width/15;
        you.position = CGPointMake(0.5, size.height/10);
        SKLabelNode *message = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        SKLabelNode *hint = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        title.fontSize = size.width/8;
        title.position = CGPointMake(0.5, size.height/4);
        hint.fontSize = size.width/20;
        hint.position = CGPointMake(0.5, -size.height/4);
        if (won) {
            title.text = @"Congrats!";
            message.text = [NSString stringWithFormat:@"Level %lu of %@ Mode!", (unsigned long)level, mode];
            you.text = @"You Completed";
            message.fontSize = size.width/15;
            hint.text = @"Tap to Continue";
        } else {
            title.text = @"Oops...";
            message.text = [NSString stringWithFormat:@"Up to Level %lu!", (unsigned long)
                            level];
            you.text = @"Your Result:";
            message.fontSize = size.width/10;
            hint.text = @"Tap to go back and Start Again!";
        }
        [self addChild:title];
        [self addChild:message];
        [self addChild:hint];
        [self addChild:you];
    }
    
    return self;
}

+(id)overBlockWithSize:(CGSize)size mode:(NSString *)mode level:(NSUInteger)level won:(BOOL)won {
    return [[GameOverBlock alloc] initWithSize:size mode:mode level:level won:won];
}


@end
