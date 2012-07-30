//
//  ViewController.m
//  KeyValueCodingAndObserving
//
//  Created by Test on 25/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SBColor.h"

@implementation ViewController

@synthesize textField;
@synthesize image;
@synthesize inputValues;
@synthesize color;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Adding observer
    
	// Do any additional setup after loading the view, typically from a nib.
    
    
	color = [[SBColor alloc] init];
    [color setUserColor:@"redColor"];
   

    
    //TextField code
    textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 50, 280, 31)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textColor = [UIColor blackColor];
    textField.font = [UIFont systemFontOfSize:17.0];
    textField.placeholder = @"Enter Color Here";
    textField.backgroundColor = [UIColor whiteColor];
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:textField];
    
    textField.delegate = (id)self;
    [self addObserver:self forKeyPath:@"textField.text" options:NSKeyValueObservingOptionNew context:NULL];
       
    //Image code
    CGRect myImageRect = CGRectMake(40.0f,190.0f,240.0f,128.0f);
    image = [[UIImageView alloc]initWithFrame:myImageRect];
     //[image setImage:[UIImage imageNamed:@"picture.jpg"]];
    
    image.backgroundColor = [UIColor redColor];
    image.opaque = YES;
    image.alpha = 90;
    [self.view addSubview:image];
     
    /*
     */
    
}


-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqual:@"textField.text"])
    {
        //[self willChangeValueForKey:@"textField"];
        color.userColor = textField.text;
        
        SEL colorSel = NSSelectorFromString([NSString stringWithFormat:@"%@%@", self.textField.text, @"Color"]);
        UIColor *newColor = nil;
        if ([UIColor respondsToSelector: colorSel])
            newColor  = [UIColor performSelector:colorSel];
        else
        {
            UIAlertView *colorNotAvailableAlert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:[NSString stringWithFormat:@"The entered color %@, is not available!", self.textField.text] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [colorNotAvailableAlert show];
            newColor = [UIColor purpleColor];
        }
       
        self.image.backgroundColor = newColor;
        // [self didChangeValueForKey:@"textField"];
        
        
    }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey
{
    if ([theKey isEqualToString:@"textField"])
    return NO;
else
    return [super automaticallyNotifiesObserversForKey:theKey]; 
}


- (BOOL)textFieldShouldReturn:(UITextField *)textFieldLocal
{   
    
 	 [textFieldLocal resignFirstResponder];
     //[self willChangeValueForKey:@"textField"];
     //[self didChangeValueForKey:@"textField"];
    
	return YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self removeObserver:self forKeyPath:@"textField"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
