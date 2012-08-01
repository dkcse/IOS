//
//  myNewView.m
//  DrawShapes
//
//  Created by Deepak kumar on 27/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "myNewView.h"

@implementation myNewView

@synthesize myLayer = _myLayer;

@synthesize customLayer = _customLayer;

- (void)setup
{
	self.myLayer = [CALayer layer];
	self.myLayer.backgroundColor = [UIColor redColor].CGColor;
	self.myLayer.cornerRadius = 5.0;
	self.myLayer.frame = CGRectMake(60, 100, 200, 200);
	self.myLayer.shadowOffset = CGSizeMake(0,3);
	self.myLayer.shadowRadius = 5.0;
	self.myLayer.shadowColor = [UIColor blackColor].CGColor;
	self.myLayer.shadowOpacity = 0.8;
	
	[self.layer addSublayer:self.myLayer];
	
	
	self.customLayer = [CALayer layer];
	self.customLayer.backgroundColor = [UIColor blueColor].CGColor;
	self.customLayer.frame = CGRectMake(20, 20, 160, 160);
	self.customLayer.shadowOffset = CGSizeMake(0, 3);
	self.customLayer.shadowRadius = 5.0;
	self.customLayer.shadowColor = [UIColor blackColor].CGColor;
	self.customLayer.shadowOpacity = 0.8;
	self.customLayer.cornerRadius = 10.0;
	self.customLayer.borderColor = [UIColor orangeColor].CGColor;
	self.customLayer.borderWidth = 2.0;
	self.customLayer.masksToBounds = YES;
	[self.myLayer addSublayer:self.customLayer];
	[self.customLayer setNeedsDisplay];
}

- (void)awakeFromNib
{
	[self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		[self setup];
    }
    return self;
}

- (void)translateLayer
{
	CABasicAnimation *translateAnimation;
	translateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
	translateAnimation.delegate = self;
	translateAnimation.duration = 5;
	translateAnimation.repeatCount = 2;
	translateAnimation.removedOnCompletion = YES;
	translateAnimation.fillMode = kCAFillModeForwards;
	translateAnimation.autoreverses = NO;
	translateAnimation.fromValue = [NSNumber numberWithFloat:0];
	translateAnimation.toValue = [NSNumber numberWithFloat:-100];
	
	[self.customLayer addAnimation:translateAnimation forKey:@"animateLayer"];
}

- (void)rotateLayer
{
	CABasicAnimation *rotateAnimation;
	rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	rotateAnimation.delegate = self;
	rotateAnimation.duration = 1;
	rotateAnimation.removedOnCompletion = YES;
	rotateAnimation.repeatCount = 2;
	rotateAnimation.autoreverses = NO;
	rotateAnimation.fillMode = kCAFillModeForwards;
	rotateAnimation.toValue = [NSNumber numberWithFloat:2*M_PI];
	
	[self.customLayer addAnimation:rotateAnimation forKey:@"animateLayer"];
}

- (void)opacityLayer
{
	CABasicAnimation *opacityAnimation;
	opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	opacityAnimation.duration = 1;
	opacityAnimation.repeatCount = 2;
	opacityAnimation.autoreverses = YES;
	opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
	opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
	opacityAnimation.fillMode = kCAFillModeForwards;
	
	[self.myLayer addAnimation:opacityAnimation forKey:@"animateLayer"];
}

- (void)scaleLayer
{
	CABasicAnimation *scaleAnimation;
	scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	scaleAnimation.delegate = self;
	scaleAnimation.duration = 1;
	scaleAnimation.removedOnCompletion = YES;
	scaleAnimation.repeatCount = 2;
	scaleAnimation.autoreverses = YES;
	scaleAnimation.fillMode = kCAFillModeForwards;
	scaleAnimation.toValue = [NSNumber numberWithFloat:0.0];
	
	[self.customLayer addAnimation:scaleAnimation forKey:@"animateLayer"];
}

@end
