//
//  MainPage.h
//  TwitterApp
//
//  Created by Deepak Kumar on 08/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Accounts/ACAccountType.h"
#import "Accounts/ACAccountStore.h"
#import "Accounts/AccountsDefines.h"
#import "Twitter/Twitter.h"

@interface MainPage : UIViewController

- (IBAction)sendTweet:(id)sender;

@property (strong,nonatomic) ACAccountStore *acAccountStore;
@property (strong,nonatomic) ACAccount *acAccount;
@property (strong,nonatomic) NSMutableArray *tweetArrayOfDict;
@property (strong,nonatomic) NSDictionary *tweetDictionary;

@end
