//
//  GestureRecognizerViewController.h
//  GestureRecognizer
//
//  Created by Deepak Kumar on 03/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureRecognizerViewController : UIViewController<UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property CGPoint position;

@property (strong,nonatomic) NSTimer *myTimer;

@property (strong,nonatomic) UIPinchGestureRecognizer *pinchRecognizer;

@property (strong,nonatomic) UIRotationGestureRecognizer *rotateRecognizer;

@property (strong,nonatomic) UITapGestureRecognizer *tapRecognizer;

@property (strong,nonatomic) UISwipeGestureRecognizer *swipeRecignizer;

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;

@end
