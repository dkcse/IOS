//
//  LCViewController.m
//  Localisation
//
//  Created by Deepak Kumar on 06/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LCViewController.h"

@interface LCViewController ()

@end

@implementation LCViewController
@synthesize titleForDifferentLanguages;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleForDifferentLanguages.text = NSLocalizedString(@"title",@"title in diffrent languages");
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTitle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
