//
//  twitViewController.h
//  TwitterApp
//
//  Created by Deepak Kumar on 08/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Twitter/Twitter.h"

@interface twitViewController : UIViewController
{
    IBOutlet UITextField *message;
    IBOutlet UITextField *website;
}

-(IBAction) tweetMessage;
-(IBAction) closeKeyboard;

@end
