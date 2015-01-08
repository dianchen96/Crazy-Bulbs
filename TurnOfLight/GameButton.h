//
//  GameButton.h
//  TurnOfLight
//
//  Created by Dian Chen on 14-11-2.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameButton : SKSpriteNode

@property(strong, nonatomic) SKAction *whenTouched;
@property(strong, nonatomic) SKLabelNode *textLabel;

/*************************Constructor***************************/
 
-(id)initWithColor:(UIColor *)color blend:(CGFloat)blend size:(CGSize)size Text:(NSString *)text textSize:(CGFloat) textsize action:(SKAction *)action;

+(id)buttonWithColor:(UIColor *)color blend:(CGFloat)blend size:(CGSize)size Text:(NSString *)text textSize:(CGFloat) textsize action:(SKAction *)action;

/*************************Methods*******************************/

-(void)touch;

@end
