//
//  DSViewController.m
//  DrawShapes
//
//  Created by Deepak kumar on 26/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DSViewController.h"

@implementation DSViewController

@synthesize myNewView = _myNewView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	CGRect myRect = self.view.bounds;
	
	myRect.size.height = 380;
	
	self.myNewView = [[myNewView alloc]initWithFrame:myRect];
	
	self.myNewView.myLayer.delegate = self;     
	
	self.myNewView.customLayer.delegate = self;
	
	self.myNewView.backgroundColor = [UIColor whiteColor];
	
	CGRect buttonFrame = CGRectMake(40, 400, 100, 40);
	
	UIButton *translateButton = [[UIButton alloc]initWithFrame:buttonFrame];

	translateButton.backgroundColor = [UIColor purpleColor];
	
	[translateButton setTitle:@"Translate" forState:UIControlStateNormal];
	
	[translateButton.layer setCornerRadius:10.0];
	
	buttonFrame = CGRectMake(175, 400, 100, 40);
	
	UIButton *rotateButton = [[UIButton alloc]initWithFrame:buttonFrame];
	
	rotateButton.backgroundColor = [UIColor purpleColor];
	
	[rotateButton setTitle:@"Rotate" forState:UIControlStateNormal];
	
	[rotateButton.layer setCornerRadius:10.0];
	
	buttonFrame = CGRectMake(40, 350, 100, 40);
	
	UIButton *opacityButton = [[UIButton alloc]initWithFrame:buttonFrame];
	
	opacityButton.backgroundColor = [UIColor purpleColor];
	
	[opacityButton setTitle:@"Opacity" forState:UIControlStateNormal];
	
	[opacityButton.layer setCornerRadius:10.0];
	
	buttonFrame = CGRectMake(175, 350, 100, 40);
	
	UIButton *scaleButton = [[UIButton alloc]initWithFrame:buttonFrame];
	
	scaleButton.backgroundColor = [UIColor purpleColor];
	
	[scaleButton setTitle:@"Scale" forState:UIControlStateNormal];
	
	[scaleButton.layer setCornerRadius:10.0];


	
	
	[self.view addSubview:self.myNewView];
	
	[self.view addSubview:translateButton];
	
	[self.view addSubview:rotateButton];
	
	[self.view addSubview:opacityButton];
	
	[self.view addSubview:scaleButton];
	
	[translateButton addTarget:self action:@selector(translateButtonPressed) forControlEvents:UIControlEventTouchUpInside];
	
	[rotateButton addTarget:self action:@selector(rotateButtonPressed) forControlEvents:UIControlEventTouchUpInside]; 
	
	[opacityButton addTarget:self action:@selector(opacityButtonPressed) forControlEvents:UIControlEventTouchUpInside];
	
	[scaleButton addTarget:self action:@selector(scaleButtonPressed) forControlEvents:UIControlEventTouchUpInside];
	
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

- (void)translateButtonPressed
{
	[self.myNewView translateLayer];
}

- (void)rotateButtonPressed
{
	[self.myNewView rotateLayer];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	NSLog(@"a");
	//[self.myNewView.myLayer removeAllAnimations];
}

- (void)opacityButtonPressed
{
	[self.myNewView opacityLayer];
}

- (void)scaleButtonPressed
{
	[self.myNewView scaleLayer];
}
 

@end
