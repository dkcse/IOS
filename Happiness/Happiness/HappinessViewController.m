//
//  HappinessViewController.m
//  Happiness
//
//  Created by Deepak Kumar on 06/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappinessViewController.h"
#import "faceView.h"

@interface HappinessViewController()
@property (nonatomic,weak) IBOutlet faceView *faceView;
@end

@implementation HappinessViewController

@synthesize faceView= _faceView;
@synthesize happiness = _happiness;

- (void) setHappiness:(int)happiness
{
    _happiness = happiness;
    [self.faceView setNeedsDisplay];
}

@end
