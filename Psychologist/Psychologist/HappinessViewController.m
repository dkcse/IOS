//
//  HappinessViewController.m
//  Happiness
//
//  Created by Deepak Kumar on 06/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappinessViewController.h"
#import "faceView.h"

@interface HappinessViewController() <FaceViewDataSource>
@property (nonatomic,weak) IBOutlet faceView *faceView;
@end

@implementation HappinessViewController

@synthesize faceView= _faceView;
@synthesize happiness = _happiness;

- (void)setHappiness:(int)happiness
{
    _happiness = happiness;
    [self.faceView setNeedsDisplay];
}

- (void) setFaceView:(faceView *)faceView
{
    _faceView = faceView;
    [self.faceView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)]];
    [self.faceView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHappinessGesture:)]];

    self.faceView.dataSource = self;
}

-(void) handleHappinessGesture:(UIPanGestureRecognizer *)gesture
{
    if((gesture.state == UIGestureRecognizerStateChanged) || (gesture.state == UIGestureRecognizerStateEnded))
    {
        CGPoint translation = [gesture translationInView:self.faceView];
        self.happiness -= translation.y / 2;
        [gesture setTranslation:CGPointZero inView:self.faceView];
    }
}

-(float) smileForFaceView:(FaceView *)sender
{
    return (self.happiness - 50.0)/50.0;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{ 
    return YES;
}


@end
