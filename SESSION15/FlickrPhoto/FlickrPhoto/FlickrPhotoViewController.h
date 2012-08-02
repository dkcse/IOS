//
//  FlickrPhotoViewController.h
//  FlickrPhoto
//
//  Created by Deepak Kumar on 02/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrOperation.h"

@interface FlickrPhotoViewController : UIViewController<FlickrDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSOperationQueue *mQueue;
}
@property (strong,nonatomic) UITableView     *imageTableView;
@property (strong,nonatomic) NSMutableArray  *Titles;         // Titles of images
@property (strong,nonatomic) NSMutableArray  *SmallImageData; // Image data (thumbnail)
@property (strong,nonatomic) NSMutableArray  *URLsLargeImage; // URL to larger image

@end
