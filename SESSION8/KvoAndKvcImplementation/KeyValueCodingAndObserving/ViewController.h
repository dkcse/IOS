//
//  ViewController.h
//  KeyValueCodingAndObserving
//
//  Created by Test on 25/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBColor.h"

@interface ViewController : UIViewController

@property(nonatomic,retain) NSDictionary * inputValues;
@property(nonatomic,retain) SBColor *color;
@property(nonatomic,retain) UITextField *textField;
@property(nonatomic,retain) UIImageView *image;

@end
