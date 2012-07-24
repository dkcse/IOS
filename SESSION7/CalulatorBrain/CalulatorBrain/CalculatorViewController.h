//
//  CalculatorViewController.h
//  CalulatorBrain 
//
//  Created by Deepak Kumar on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *display;
- (IBAction)digitPressed:(id)sender;
- (IBAction)reset:(id)sender;

- (IBAction)deleteOneDigit:(id)sender;

@end
