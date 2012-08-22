//
//  viewAnnotation.h
//  MapView
//
//  Created by Deepak Kumar on 22/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface viewAnnotation : UIViewController

@property (strong, nonatomic) NSString *titleForSelectedPin;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSURL *imageURL;
@property (strong,nonatomic) NSArray *dataForAnnotation;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageLabel;
@property (strong, nonatomic) IBOutlet UILabel *subtitleLabel;

- (IBAction)goBackToMapView:(id)sender;

@end
