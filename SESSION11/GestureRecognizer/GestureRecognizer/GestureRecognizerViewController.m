//
//  GestureRecognizerViewController.m
//  GestureRecognizer
//
//  Created by Deepak Kumar on 03/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GestureRecognizerViewController.h"

@interface GestureRecognizerViewController ()
@property  CGAffineTransform originalTransform;

@end

@implementation GestureRecognizerViewController
@synthesize imageView;
@synthesize position = _position;

@synthesize myTimer = _myTimer;
@synthesize originalTransform = _originalTransform;

@synthesize pinchRecognizer = _pinchRecognizer;
@synthesize rotateRecognizer = _rotateRecognizer;
@synthesize tapRecognizer = _tapRecognizer;
@synthesize swipeRecignizer = _swipeRecignizer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _position = CGPointMake(10, 3);
    
    self.originalTransform = self.imageView.transform;
    
    self.pinchRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)];
    
    [self.imageView addGestureRecognizer:self.pinchRecognizer];
    
    self.rotateRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];
    
    [self.imageView addGestureRecognizer:self.rotateRecognizer];
    
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    
    self.tapRecognizer.numberOfTapsRequired = 2;
    
    [self.view addGestureRecognizer:self.tapRecognizer];
    
    self.swipeRecignizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    [self.view addGestureRecognizer:self.swipeRecignizer];
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer 
{    
//    CGPoint translation = [recognizer translationInView:self.view];
    CGPoint translation = [recognizer locationInView:recognizer.view.superview];
    recognizer.view.center = translation;
//    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,recognizer.view.center.y + translation.y);
  //  [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
}

- (void)handlePinch:(UIPinchGestureRecognizer *)pinchRecognizer
{
    CGFloat scale = pinchRecognizer.scale;
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, scale, scale);
    pinchRecognizer.scale = 1.0;
}

- (void) handleRotate:(UIRotationGestureRecognizer *)rotateRecognizer
{
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotateRecognizer.rotation);
    rotateRecognizer.rotation = 0;    
}

- (void) handleTap:(UITapGestureRecognizer *)tapRcognizer
{
    self.imageView.center = self.view.center;
    self.imageView.transform = self.originalTransform;
    [self.myTimer invalidate];
    self.myTimer = nil;
    
}

- (void) handleSwipe:(UISwipeGestureRecognizer *)swipeRecognizer
{
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(bounce) userInfo:nil repeats:YES];
}

- (void) bounce
{
    self.imageView.center = CGPointMake(self.imageView.center.x+_position.x, self.imageView.center.y+_position.y);
    if(self.imageView.center.x >260 || self.imageView.center.x <60)
        _position.x = -_position.x;
    if(self.imageView.center.y >420 || self.imageView.center.y <80)
        _position.y = -_position.y;
    
}

@end
