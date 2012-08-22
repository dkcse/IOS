//
//  ViewController.h
//  MapView
//
//  Created by Deepak Kumar on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/Mapkit.h>
#import <CoreLocation/CoreLocation.h>
#import "Annotation.h"
#import "ViewAnnotation.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define GOOGLE_API_KEY @"AIzaSyCizq7QvPED3UkztXhCs1BTqyyFoRWRYWI"

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic)  BOOL firstLaunch;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocationCoordinate2D currentCentre;
@property (nonatomic) int currenDist; 

- (IBAction)ToolBarButtonPressed:(id)sender;

@end
