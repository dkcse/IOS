//
//  DetailViewController.m
//  TwitterApp
//
//  Created by Deepak Kumar on 09/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController (Private)

- (void)customInitialize;
- (void)releaseAllViews;

@end


#pragma mark -

@implementation DetailViewController

@synthesize tweetDetails = _tweetDetails;
@synthesize imageUrl = _imageUrl;
@synthesize userImage;
@synthesize userName;
@synthesize userText,tweetMessage,imageContents,usrName;
//@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		[self customInitialize];
    }

    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    self.userName.text = self.usrName;
    self.userText.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    self.userText.text = self.tweetMessage;
    self.userImage.image = [UIImage imageWithData:self.imageContents];
   

}

- (void)viewDidUnload
{
    [self setUserImage:nil];
    [self setUserName:nil];
    [self setUserText:nil];
    [super viewDidUnload];
    [self releaseAllViews];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark mark -
#pragma mark Delloc


@end