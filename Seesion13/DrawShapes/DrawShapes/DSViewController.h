//
//  DSViewController.h
//  DrawShapes
//
//  Created by Deepak kumar on 26/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myNewView.h"

@interface DSViewController : UIViewController

- (void)translateButtonPressed;

- (void)rotateButtonPressed;

- (void)opacityButtonPressed;

- (void)scaleButtonPressed;

@property (strong,nonatomic) myNewView *myNewView;

@end
