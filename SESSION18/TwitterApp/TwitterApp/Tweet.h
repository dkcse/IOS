//
//  Tweet.h
//  TwitterApp
//
//  Created by Deepak Kumar on 14/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Tweet : NSManagedObject

@property (nonatomic, retain) NSString * dateCreated;
@property (nonatomic, retain) NSNumber * tweetID;
@property (nonatomic, retain) NSString * tweetMessage;
@property (nonatomic, retain) User *userIdentity;

@end
