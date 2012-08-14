//
//  TweetTableViewController.h
//  TwitterApp
//
//  Created by Deepak Kumar on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "Accounts/ACAccountType.h"
#import "Accounts/ACAccountStore.h"
#import "Accounts/AccountsDefines.h"
#import "Twitter/Twitter.h"
#import "twitAppDelegate.h"

@interface TweetTableViewController : UITableViewController 

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong,nonatomic) UIActivityIndicatorView *activitySpinner;
@property (strong,nonatomic) ACAccountStore *acAccountStore;
@property (strong,nonatomic) ACAccount *acAccount;
@property (strong,nonatomic) NSURL *imageURL;
@property (strong,nonatomic) NSData *imageData;
@property (strong,nonatomic) NSArray *tweetArrayOfDict;
@property (nonatomic) BOOL reachability;
@property NSIndexPath* myIndexPath;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *refreshButton;

- (IBAction)refreshTable:(id)sender;
- (void)fetchTweet;

@end
