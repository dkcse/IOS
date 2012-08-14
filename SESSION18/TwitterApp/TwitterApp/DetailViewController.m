//
//  DetailViewController.m
//  TwitterApp
//
//  Created by Deepak Kumar on 09/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import <Twitter/Twitter.h>

@interface DetailViewController (Private)

- (void)customInitialize;
- (void)releaseAllViews;

@end

@implementation DetailViewController

@synthesize tweetDetails = _tweetDetails;
@synthesize selectedTweet = _selectedTweet;
@synthesize reachable = _reachable;
@synthesize imageUrl = _imageUrl;
@synthesize userImage;
@synthesize userName;
@synthesize userText,tweetMessage,imageContents,usrName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
		[self customInitialize];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    if(self.reachable)
    {
    self.userName.text = self.usrName;
    self.userText.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    self.userText.text = self.tweetMessage;
    self.userImage.image = [UIImage imageWithData:self.imageContents];
    }
    else
    {
        self.userName.text = [self.selectedTweet valueForKeyPath:@"userIdentity.userName"];
        self.userText.text = [self.selectedTweet valueForKey:@"tweetMessage"];
        self.userImage.image =  [UIImage imageWithData:[self.selectedTweet valueForKeyPath:@"userIdentity.userImage"]];
    }
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
    return YES;
}

- (IBAction)replyToTweet:(id)sender
{
    NSString *initialText = [NSString stringWithFormat:@"@%@",self.userName.text];
    if ([TWTweetComposeViewController canSendTweet])
    {
        TWTweetComposeViewController *tweetAgain = [[TWTweetComposeViewController alloc] init];
        [tweetAgain setInitialText:initialText];
  	    [self presentModalViewController:tweetAgain animated:YES];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] 
                                  initWithTitle:@"Sorry"                                                             
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"  
                                  delegate:self                                              
                                  cancelButtonTitle:@"OK"                                                   
                                  otherButtonTitles:nil];
        [alertView show];
    }
    
    NSLog(@"called");

}
@end