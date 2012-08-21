//
//  PListDownloader.m
//  BlockTest
//
//  Created by Deepak Kumar on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PListDownloader : NSObject

- (void) downloadPlistForURL:(NSURL *) url completionBlock:(void (^)(NSArray *data, NSError *error)) block;

@end
