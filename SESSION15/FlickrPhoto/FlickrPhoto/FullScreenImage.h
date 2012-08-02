//
//  FullScreenImage.h
//  FlickrPhoto
//
//  Created by Deepak Kumar on 02/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FullScreenImage : UIViewController

@property (strong,nonatomic) NSURL* imageUrl;
@property (strong, nonatomic) IBOutlet UIImageView *fullScreenView;

@end
