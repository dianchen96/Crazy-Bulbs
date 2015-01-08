//
//  GameScene.m
//  TurnOfLight
//
//  Created by Dian Chen on 14-10-30.
//  Copyright (c) 2014年 Dian Chen. All rights reserved.
//

#import "GameScene.h"
#import "GameGrids.h"
#import "GameTile.h"
#import "GameOverBlock.h"

@implementation GameScene

-(id)initWithSize:(CGSize)size length:(NSUInteger)length hardness:(NSUInteger)hardness newBgm:(BOOL)newBgm pastBGM:(AVAudioPlayer *)player {
    if (self = [super initWithSize:size]) {
        /*Set the paramters*/
        self.gameState = ONGOING;
        self.length = length;
        self.hardness = hardness;
        self.level = length * length + hardness - 4;
        
        if (newBgm) {
            NSError *error;
            NSURL * backgroundMusicURL = [[NSBundle mainBundle] URLForResource:@"BGM" withExtension:@"mp3"];
            self.backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
            self.backgroundMusicPlayer.numberOfLoops = -1;
            [self.backgroundMusicPlayer prepareToPlay];
            [self.backgroundMusicPlayer play];
        } else {
            self.backgroundMusicPlayer = player;
            [self.backgroundMusicPlayer play];
        }
        
        /*Set the LoseMask*/
        SKSpriteNode *losemask = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:size];
        self.loseMask = losemask;
        /*Set the Zone*/
        SKSpriteNode *zone = [SKSpriteNode spriteNodeWithImageNamed:@"Zone"];
        CGFloat zoneLength = size.width*6/7 + 20;
        [zone setSize:CGSizeMake(zoneLength, zoneLength)];
        [self addChild:zone];
        /*Set the Titles*/
        SKLabelNode *level = [SKLabelNode labelNodeWithFontNamed:@"ChalkboardSE-Bold"];
        level.text = [NSString stringWithFormat:@"Level: %lu", (unsigned long)self.level];
        level.fontSize = 25.0;
        level.position = CGPointMake(-size.width/3+5.0, size.height/3+30.0);
        [self addChild:level];
        
        /*Set the GameGrids*/
        self.game = [[GameGrids alloc] initWithLength:length hardness:hardness tileSize:
                     CGSizeMake(zoneLength/length, zoneLength/length)];

        for (int i = 0; i < self.length; i++) {
            for (int j = 0; j < self.length; j++) {
                GameTile *tile = [self.game tileAtRow:i Col:j];
                tile.position = CGPointMake(i*tile.size.width-zone.size.width/2+tile.size.width/2
                                            , j*tile.size.height-zone.size.width/2+tile.size.width/2);
                [self addChild:tile];
            }
        }
    }
    [self addChild:self.loseMask];
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {    
    /*Avoid Consequtive tap*/
    if ([self hasActions]) {
        return;
    }
    /*Run the Sound Effect*/
    [self runAction:[SKAction playSoundFileNamed:@"switch.wav" waitForCompletion:NO]];
    /*Get the Bulb*/
    CGPoint touch = [[touches anyObject] locationInNode:self];
    SKNode *touched = [self nodeAtPoint:touch];
    if ([touched isKindOfClass:[GameTile class]]) {
        GameTile *bulb = (GameTile*) touched;
        NSUInteger row = bulb.row;
        NSUInteger col = bulb.col;
        NSMutableArray *targets = [NSMutableArray arrayWithCapacity:5];
        if (row > 0) {
            GameTile *next = [self.game tileAtRow:row-1 Col:col];
            [next flip];
            [targets addObject:next];
        }
        if (row < self.length-1) {
            GameTile *next = [self.game tileAtRow:row+1 Col:col];
            [next flip];
            [targets addObject:next];
        }
        if (col > 0) {
            GameTile *next = [self.game tileAtRow:row Col:col-1];
            [next flip];
            [targets addObject:next];
        }
        if (col < self.length-1) {
            GameTile *next = [self.game tileAtRow:row Col:col+1];
            [next flip];
            [targets addObject:next];
        }
        [bulb flip];
        [targets addObject:bulb];
        [self makeAction:targets];
        
        /*Check if Done*/
        if ([self.game checkDone]) {
            self.gameState = WON;
            [self runAction:[SKAction playSoundFileNamed:@"passed.wav" waitForCompletion:NO]];
            [self addChild:[GameOverBlock overBlockWithSize:self.size mode:@"Classic" level:self.level won:YES]];
        }
    }
}



-(void)makeAction:(NSMutableArray*)targets {
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:targets.count];
    for (GameTile *bulb in targets) {
        SKAction *action = [SKAction runBlock:^{
            CGPoint origin = bulb.position;
            SKAction *jump = [SKAction moveTo:CGPointMake(origin.x, origin.y+10.0) duration:0.1];
            SKAction *back = [SKAction moveTo:origin duration:0.1];
            [bulb runAction:[SKAction sequence:@[jump, back]]];}];
        [actions addObject:action];
    }
    [self runAction:[SKAction sequence:@[[SKAction group:actions], [SKAction waitForDuration:0.2]]]];
}

@end
