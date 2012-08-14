//
//  User.h
//  TwitterApp
//
//  Created by Deepak Kumar on 14/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tweet;

@interface User : NSManagedObject

@property (nonatomic, retain) NSData * userImage;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSSet *userTweet;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addUserTweetObject:(Tweet *)value;
- (void)removeUserTweetObject:(Tweet *)value;
- (void)addUserTweet:(NSSet *)values;
- (void)removeUserTweet:(NSSet *)values;

@end
