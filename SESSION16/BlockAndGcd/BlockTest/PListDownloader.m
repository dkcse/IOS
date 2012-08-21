//
//  PListDownloader.m
//  BlockTest
//
//  Created by Deepak Kumar on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PListDownloader.h"

@implementation PListDownloader

- (id)init
{
    self = [super init];
    if (self)
    {
        // Initialization code here.
    }
    return self;
}

- (void) downloadPlistForURL:(NSURL *) url completionBlock:(void (^)(NSArray *data, NSError *error)) block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
        NSArray *returnArray = [NSArray arrayWithContentsOfURL:url];
        if(returnArray) 
        {
            block(returnArray, nil);
        } 
        else 
        {
            NSError *error = [NSError errorWithDomain:@"plist_download_error" code:1 
                                             userInfo:[NSDictionary dictionaryWithObject:@"Can't fetch data" forKey:NSLocalizedDescriptionKey]];
            block(nil, error);
        }
        
    });
}

@end
