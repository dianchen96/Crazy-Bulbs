//
//  GameButton.m
//  TurnOfLight
//
//  Created by Dian Chen on 14-11-2.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import "GameButton.h"

NSString *buttonName = @"Button";

@implementation GameButton

-(id)initWithColor:(UIColor *)color blend:(CGFloat)blend size:(CGSize)size Text:(NSString *)text textSize:(CGFloat)textsize action:(SKAction *)action{
    if (self = [super initWithImageNamed:buttonName]) {
        self.anchorPoint = CGPointMake(0.5, 0.35);
        self.whenTouched = action;
        self.size = size;
        self.color = color;
        self.colorBlendFactor = blend;
        self.textLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima-Bold"];
        self.textLabel.text = text;
        self.textLabel.fontSize = textsize;
        [self addChild:self.textLabel];
    }
    
    return self;
}

-(void)touch {
    CGSize originSize = self.size;
    [self runAction:[SKAction sequence:@[[SKAction resizeByWidth:originSize.width*0.5 height:originSize.height*0.5 duration:0.1], [SKAction resizeToWidth:originSize.width height:originSize.height duration:0.1], self.whenTouched]]];
}



+(id)buttonWithColor:(UIColor *)color blend:(CGFloat)blend size:(CGSize)size Text:(NSString *)text textSize:(CGFloat)textsize action:(SKAction *)action {
    return [[[self class] alloc] initWithColor:color blend:(CGFloat)blend size:size Text:text textSize:textsize action:action];
}

@end
