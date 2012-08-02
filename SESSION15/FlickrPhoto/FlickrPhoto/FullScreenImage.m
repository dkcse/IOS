//
//  FullScreenImage.m
//  FlickrPhoto
//
//  Created by Deepak Kumar on 02/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FullScreenImage.h"

@implementation FullScreenImage

@synthesize fullScreenView = _fullScreenView;
@synthesize imageUrl = _imageUrl;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSData *imageData = [NSData dataWithContentsOfURL:self.imageUrl];
    UIImage *image = [UIImage imageWithData:imageData];
    self.fullScreenView.image = image;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setFullScreenView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
