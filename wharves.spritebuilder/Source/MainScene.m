#import "MainScene.h"

@implementation MainScene { CCNode *troy;}

- (void)didLoadFromCCB {
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
}
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    // ensure followed object is in visible are when starting
    self.position = ccp(0,0);
    CCActionFollow *follow = [CCActionFollow actionWithTarget:troy ];
    [self runAction:follow];
    CGPoint p = [touch locationInNode:self];
    p.y = troy.position.y;
    CCActionMoveTo *move = [CCActionMoveTo actionWithDuration:3.0 position:p];
    CCActionFlipX *flip;
    if(troy.position.x < p.x){
        flip = [CCActionFlipX actionWithFlipX:NO];
    } else {
        flip = [CCActionFlipX actionWithFlipX:YES];
    }      [troy.animationManager runAnimationsForSequenceNamed:@"Walk"];
    [troy stopAllActions];
    [troy runAction:move];
    [troy runAction:flip];


}
- (void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    [troy.animationManager runAnimationsForSequenceNamed:@"Idle"];
    [troy stopAllActions];
}

@end
