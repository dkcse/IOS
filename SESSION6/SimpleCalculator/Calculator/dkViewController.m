//
//  dkViewController.m
//  Calculator
//
//  Created by Deepak Kumar on 13/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "dkViewController.h"

@interface dkViewController ()

@end

@implementation dkViewController
@synthesize output;
@synthesize operator;
@synthesize firstOperand;
@synthesize secondOperand;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setOutput:nil];
    [self setOperator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)Reset:(id)sender {
    self.output.text=@"0";
}

- (IBAction)Result:(id)sender {
    
    
    float a = [firstOperand floatValue];
    
    float c;
    
    secondOperand = self.output.text;
    float b = [secondOperand floatValue];
    
    NSString *op=self.operator.text;
    if([op isEqualToString:@"+"])
    {
        c=a+b;
        self.operator.text=@"0";
    }
    else if([op isEqualToString:@"-"])
    {
        c=a-b;   
        self.operator.text=@"0";
    }
    else
    if([op isEqualToString:@"*"]) 
    {
        
        c=a*b;
        self.operator.text=@"0";
    }
    else
        if([op isEqualToString:@"/"]) 
        {
            
          
            c=a/b;
            self.operator.text=@"0";
        }

                
    NSString *n=[[NSString alloc]initWithFormat:@"%f",c];
    
    self.output.text=n;
    
}

- (IBAction)ZeroPressed:(id)sender {
    
    NSString *ns = self.output.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"0"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"%@0",ns];
    }
    self.output.text=newString;
 
    
}

- (IBAction)onePressed:(id)sender {
    
    NSString *ns = self.output.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"1"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"%@1",ns];
    }
    self.output.text=newString;

}


- (IBAction)twoPressed:(id)sender {
    NSString *ns = self.output.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"2"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"%@2",ns];
    }
    self.output.text=newString;

}


- (IBAction)threePressed:(id)sender {
    
    NSString *ns = self.output.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"3"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"%@3",ns];
    }
    self.output.text=newString;

}

- (IBAction)fourPressed:(id)sender {
    
    NSString *ns = self.output.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"4"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"%@4",ns];
    }
    self.output.text=newString;

}

- (IBAction)fivePressed:(id)sender {
    NSString *ns = self.output.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"5"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"%@5",ns];
    }
    self.output.text=newString;
  
}

- (IBAction)sixPressed:(id)sender {
    NSString *ns = self.output.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"6"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"%@6",ns];
    }
    self.output.text=newString;
    
}

- (IBAction)sevenPressed:(id)sender {
    NSString *ns = self.output.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"7"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"%@7",ns];
    }
    self.output.text=newString;
    
}

- (IBAction)eightPressed:(id)sender {
    NSString *ns = self.output.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"8"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"%@8",ns];
    }
    self.output.text=newString;
 
}

- (IBAction)ninePressed:(id)sender {
    NSString *ns = self.output.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"9"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"%@9",ns];
    }
    self.output.text=newString;
  
}

- (IBAction)pluePressed:(id)sender {
    NSString *ns = self.operator.text;
    NSString *newString;
   
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"+"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"ERROR",ns];
        
    }
    self.operator.text=newString;
    self.firstOperand=self.output.text;
    self.output.text=@"0";
    
    
    /*NSString * fullString = [[NSString alloc]initWithFormat:@"%@+",firstOperand];
    self.output.text=fullString;
    fullString=nil;*/
}

- (IBAction)minusPressed:(id)sender {
    NSString *ns = self.operator.text;
    NSString *newString;

    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"-"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"ERROR",ns];
    }
    self.operator.text=newString;
    self.firstOperand=self.output.text;
    self.output.text=@"0";

    
}

- (IBAction)multiplyPressed:(id)sender {
    NSString *ns = self.operator.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"*"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"ERROR",ns];
    }
    self.operator.text=newString;
    self.firstOperand=self.output.text;
    self.output.text=@"0";


}
- (IBAction)dividePressed:(id)sender {
    NSString *ns = self.operator.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"/"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"ERROR",ns];
    }
    self.operator.text=newString;
    self.firstOperand=self.output.text;
    self.output.text=@"0";
    

}

- (IBAction)squareRoot:(id)sender {
    NSString *ns = self.operator.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"SQ.RT"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"ERROR",ns];
    }
    self.operator.text=newString;
    self.firstOperand=self.output.text;
    self.output.text=@"0";
    

}

- (IBAction)absoluteValue:(id)sender {
    NSString *ns = self.operator.text;
    NSString *newString;
    if ([ns isEqualToString:@"0"]) {
        newString=[[NSString alloc]initWithFormat:@"ABSOLUTE"];
    }
    else
    {
        newString=[[NSString alloc]initWithFormat:@"ERROR",ns];
    }
    self.operator.text=newString;
    self.firstOperand=self.output.text;
    self.output.text=@"0";
    

}
@end
