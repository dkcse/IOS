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


@interface TweetTableViewController : UITableViewController 

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong,nonatomic) ACAccountStore *acAccountStore;
@property (strong,nonatomic) ACAccount *acAccount;

@property NSIndexPath* myIndexPath;
@property (strong,nonatomic) NSURL *imageURL;
@property (strong,nonatomic) NSData *imageData;

- (IBAction)refreshTable:(id)sender;

//changed property


@property (strong,nonatomic) NSMutableArray *tweetArrayOfDict;
//@property (strong,nonatomic) NSDictionary *tweetDictionary;

//- (IBAction)sendTweet:(id)sender;
- (void)fetchTweet;


@end
