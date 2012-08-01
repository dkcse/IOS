//
//  myNewView.h
//  DrawShapes
//
//  Created by Deepak kumar on 27/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface myNewView : UIView

@property (strong, nonatomic) CALayer *myLayer;

@property (strong, nonatomic) CALayer *customLayer;

- (void)translateLayer;

- (void)rotateLayer;

- (void)opacityLayer;

- (void)scaleLayer;

@end
