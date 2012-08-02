//
//  FlickrOperation.m
//  FlickrPhoto
//
//  Created by Deepak Kumar on 02/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlickrOperation.h"
#define URL @"http://www.flickr.com/services/rest/?method=flickr.interestingness.getList&format=json&api_key=aa621a9050ef8dfbd9621cc311da86aa"

@implementation FlickrOperation

@synthesize delegate = _delegate;
@synthesize photoTitles = _photoTitles;
@synthesize photoSmallImageData = _photoSmallImageData;
@synthesize photoURLsLargeImage = _photoURLsLargeImage;
@synthesize jsonDataString = _jsonDataString;
@synthesize jsonDataDictionary = _jsonDataDictionary;


- (void) main
{
    NSError *error = [[NSError alloc] init];
    self.jsonDataString = [NSString stringWithContentsOfURL:[NSURL URLWithString:URL] encoding:NSUTF8StringEncoding error:&error];
    self.jsonDataString = [self.jsonDataString substringFromIndex:14];
    self.jsonDataString = [self.jsonDataString substringToIndex:[self.jsonDataString length]-1];
    NSData *jsonDataAsNSData = [self.jsonDataString dataUsingEncoding:NSUTF8StringEncoding];
    self.jsonDataDictionary = [[NSDictionary alloc] init];
    self.jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonDataAsNSData options:kNilOptions error:&error];
    self.photoTitles = [[NSMutableArray alloc] init];
    self.photoSmallImageData = [[NSMutableArray alloc] init];
    self.photoURLsLargeImage = [[NSMutableArray alloc] init];
    NSArray *photos = [[self.jsonDataDictionary objectForKey:@"photos"] objectForKey:@"photo"];
    
    for (NSDictionary *photo in photos)
    {
        // Get title of the image
        NSString *title = [photo objectForKey:@"title"];
        // Save the title to the photo titles array
        [self.photoTitles addObject:(title.length > 0 ? title : @"Untitled")];
        // Build the URL to where the image is stored
        NSString *photoURLString = 
        [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_s.jpg", 
        [photo objectForKey:@"farm"],[photo objectForKey:@"server"], 
        [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];
        [self.photoSmallImageData addObject:[NSData dataWithContentsOfURL:[NSURL URLWithString:photoURLString]]];
        
        // Build and save the URL to the large image so we can zoom
        photoURLString = 
        [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_m.jpg", 
        [photo objectForKey:@"farm"], [photo objectForKey:@"server"], 
        [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];
        [self.photoURLsLargeImage addObject:[NSURL URLWithString:photoURLString]];      
        [self performSelectorOnMainThread:@selector(fetchedData) withObject:nil  waitUntilDone:YES];
    }
}

- (void) fetchedData
{
    [self.delegate sendTitle:self.photoTitles smallImageData:self.photoSmallImageData LargeImageData:self.photoURLsLargeImage];
}

@end
