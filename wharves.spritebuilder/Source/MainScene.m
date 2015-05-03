#import "MainScene.h"

@implementation MainScene {
    CCNode *troy;
    CCNode *contentNode;
}

- (void)didLoadFromCCB {
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
    
    // the bounding box is set by the size of the main scene in spritebuilder
    CGRect box = CGRectMake(0, 0, self.boundingBox.size.width, self.boundingBox.size.height);
    CCActionFollow *follow = [CCActionFollow actionWithTarget:troy worldBoundary:box];
    [contentNode runAction:follow];
}
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    // ensure followed object is in visible are when starting
    self.position = ccp(0,0);
    
    CGPoint p = [touch locationInNode:contentNode];
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
