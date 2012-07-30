//
//  dkViewController.h
//  Calculator
//
//  Created by Deepak Kumar on 13/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dkViewController : UIViewController
- (IBAction)Reset:(id)sender;
- (IBAction)Result:(id)sender;
- (IBAction)ZeroPressed:(id)sender;
- (IBAction)onePressed:(id)sender;
- (IBAction)twoPressed:(id)sender;
- (IBAction)threePressed:(id)sender;
- (IBAction)fourPressed:(id)sender;
- (IBAction)fivePressed:(id)sender;
- (IBAction)sixPressed:(id)sender;
- (IBAction)sevenPressed:(id)sender;
- (IBAction)eightPressed:(id)sender;
- (IBAction)ninePressed:(id)sender;
- (IBAction)pluePressed:(id)sender;
- (IBAction)minusPressed:(id)sender;
- (IBAction)multiplyPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *output;

@property (weak, nonatomic) IBOutlet UITextField *operator;
@property (copy, nonatomic) NSString *firstOperand;
@property (copy, nonatomic) NSString *secondOperand;
- (IBAction)dividePressed:(id)sender;

@end
