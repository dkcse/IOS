//
//  CalculatorViewController.m
//  CalulatorBrain
//
//  Created by Deepak Kumar on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL enteringFirstDigitOrNot;
@property (nonatomic,strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController
@synthesize display = _display;

@synthesize brain=_brain;
@synthesize enteringFirstDigitOrNot=_enteringFirstDigitOrNot;

- (CalculatorBrain *)brain
{
    if(!_brain) _brain=[[CalculatorBrain alloc] init];
    return _brain;   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDisplay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//-(CalculatorBrain *) 

- (IBAction)digitPressed:(UIButton *)sender 
{
    NSString *digit =[sender currentTitle];
    if(self.enteringFirstDigitOrNot)
    {
    NSString *currentText = self.display.text;  
    NSString *newText = [currentText stringByAppendingFormat:digit];
    self.display.text=newText;
    
    }
    else{
        self.display.text=digit;
        self.enteringFirstDigitOrNot=YES;
    }
}

- (IBAction)reset:(id)sender 
{
    //[self.brain.operandStack removeAllObjects];
       self.display.text=@"0";
}

- (IBAction)deleteOneDigit:(id)sender
{
  //  [operandStack removeLastObject];
}
- (IBAction)operationPressed:(UIButton *)sender 
{
    double result = [self.brain performOperation: sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g",result];
    self.display.text=resultString;
}
- (IBAction)enterPressed:(id)sender 
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.enteringFirstDigitOrNot=NO;
}


@end
