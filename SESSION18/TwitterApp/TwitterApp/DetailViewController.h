//
//  DetailViewController.h
//  TwitterApp
//
//  Created by Deepak Kumar on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol GetDataDelegate
//
//- (NSDictionary *)getData;
//
//@end

@interface DetailViewController : UIViewController

@property (strong,nonatomic) NSDictionary *tweetDetails;
@property (strong,nonatomic) NSString *imageUrl;
@property (strong, nonatomic) IBOutlet UIImageView *userImage;

@property (strong, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet UITextView *userText;

@property (strong,nonatomic) NSString *tweetMessage;
@property(nonatomic,strong) NSData *imageContents;
@property (strong,nonatomic) NSString *usrName;

//@property (weak, nonatomic) id <GetDataDelegate> delegate;

@end
