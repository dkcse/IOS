//
//  FlickrOperation.h
//  FlickrPhoto
//
//  Created by Deepak Kumar on 02/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol FlickrDelegate <NSObject>

- (void)sendTitle:(NSMutableArray *)titles smallImageData:(NSMutableArray *)smallImageData LargeImageData:(NSMutableArray *)largeImageData;

@end


@interface FlickrOperation : NSOperation

@property (strong,nonatomic) id <FlickrDelegate> delegate;
@property (strong,nonatomic) NSString* jsonDataString;
@property (strong,nonatomic) NSDictionary* jsonDataDictionary;
@property (strong,nonatomic) NSMutableArray  *photoTitles;         // Titles of images
@property (strong,nonatomic) NSMutableArray  *photoSmallImageData; // Image data (thumbnail)
@property (strong,nonatomic) NSMutableArray  *photoURLsLargeImage; // URL to larger image

@end
