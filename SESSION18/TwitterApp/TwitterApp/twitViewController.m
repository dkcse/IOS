//
//  twitViewController.m
//  TwitterApp
//
//  Created by Deepak Kumar on 08/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "twitViewController.h"

@interface twitViewController ()

@end

@implementation twitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)tweetMessage
{ 
    TWTweetComposeViewController *twitter = [[TWTweetComposeViewController alloc]init];
    [twitter setInitialText:message.text];
    [twitter addURL:[NSURL URLWithString:website.text]];
    if ([TWTweetComposeViewController canSendTweet] ) 
    {
        [self presentViewController:twitter animated:YES completion:nil ];
    }
    else 
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Unable to tweet" message:@"This only works with Twitter configured iOS 5" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        [alertView show];
        return;
    }
    twitter.completionHandler = ^(TWTweetComposeViewControllerResult res) 
    {
        if(res == TWTweetComposeViewControllerResultDone) 
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Tweeet Succeeded" message:@"Message Sent Successfully" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
            [alertView show];
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Tweet Failed" message:@"Message sending Failed, Try again Later..." delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
            [alertView show];
        }
        [self dismissModalViewControllerAnimated:YES];
    };
    
}

- (IBAction) closeKeyboard 
{
    
}


@end
