//
//  TweetTableViewController.h
//  TwitterApp
//
//  Created by Deepak Kumar on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainPage.h"

@interface TweetTableViewController : UITableViewController

@property (strong,nonatomic) MainPage *mainPageObj;

@property (strong,nonatomic) NSArray *tweetArray;

@end
