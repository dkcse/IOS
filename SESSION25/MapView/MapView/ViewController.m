//
//  ViewController.m
//  MapView
//
//  Created by Deepak Kumar on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


@synthesize locationManager = _locationManager;
@synthesize mapView;
@synthesize currenDist = _currenDist;
@synthesize currentCentre = _currentCentre;
@synthesize firstLaunch = _firstLaunch;

-(void)viewDidLoad 
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Make this controller the delegate for the map view.
    self.mapView.delegate = self;     
    
    // Ensure that you can view your own location in the map view.
    [self.mapView setShowsUserLocation:YES];
    
    //Instantiate a location object.
    self.locationManager = [[CLLocationManager alloc] init];
    
    //Make this controller the delegate for the location manager.
    [self.locationManager setDelegate:self];
    
    //Set some parameters for the location object.
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)mapView:(MKMapView *)mView didAddAnnotationViews:(NSArray *)views
{    
    CLLocationCoordinate2D centre = [mView centerCoordinate];
    MKCoordinateRegion region;
    //If this is the first launch of the app, then set the center point of the map to the user's location.
    if (self.firstLaunch)
    {
        region = MKCoordinateRegionMakeWithDistance(self.locationManager.location.coordinate,1000,1000);
        self.firstLaunch=NO;
    }
    else 
    {
        //Set the center point to the visible region of the map and change the radius to match the search radius passed to the Google query string.
        region = MKCoordinateRegionMakeWithDistance(centre,_currenDist,_currenDist);
    }
    //Set the visible region of the map.
    [mView setRegion:region animated:YES];
}


- (IBAction)ToolBarButtonPressed:(id)sender
{
    NSLog(@"hi");
    UIBarButtonItem *button = (UIBarButtonItem *)sender;
    NSString *buttonTitle = [button.title lowercaseString];
    [self queryGooglePlaces:buttonTitle];
}


-(void) queryGooglePlaces: (NSString *) googleType 
{
    NSLog(@"places");
    
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%f,%f&radius=%@&types=%@&sensor=true&key=%@", self.currentCentre.latitude, self.currentCentre.longitude, [NSString stringWithFormat:@"%i", self.currenDist], googleType, GOOGLE_API_KEY];
    
    // NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=-33.8670522,151.1957362&radius=5000&types=companyd&sensor=false&key=GOOGLE_API_KEY"];
    
    //Formulate the string as a URL object.
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    
    // Retrieve the results of the URL.
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
}


-(void)fetchedData:(NSData *)responseData 
{
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:responseData                           
                          options:kNilOptions 
                          error:&error];
    
    //The results from Google will be an array obtained from the NSDictionary object with the key "results".
    NSArray* places = [json objectForKey:@"results"]; 
    [self plotPositions:places];
    //Write out the data to the console.
    NSLog(@"Google Data: %@", places);
}


-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated 
{
    //Get the east and west points on the map so you can calculate the distance (zoom level) of the current map view.
    MKMapRect mRect = self.mapView.visibleMapRect;
    MKMapPoint eastMapPoint = MKMapPointMake(MKMapRectGetMinX(mRect), MKMapRectGetMidY(mRect));
    MKMapPoint westMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), MKMapRectGetMidY(mRect));
    
    //Set your current distance instance variable.
    self.currenDist = MKMetersBetweenMapPoints(eastMapPoint, westMapPoint);
    //self.currenDist = 1000;
    
    //Set your current center point on the map instance variable.
    self.currentCentre = self.mapView.centerCoordinate;
}


-(void)plotPositions:(NSArray *)data
{
    // 1 - Remove any existing custom annotations but not the user location blue dot.
    for (id<MKAnnotation> annotation in mapView.annotations)
    {
        if ([annotation isKindOfClass:[Annotation class]]) 
        {
            [mapView removeAnnotation:annotation];
        }
    }
    // 2 - Loop through the array of places returned from the Google API.
    for (int i=0; i<[data count]; i++) {
        //Retrieve the NSDictionary object in each index of the array.
        NSDictionary* place = [data objectAtIndex:i];
        // 3 - There is a specific NSDictionary object that gives us the location info.
        NSDictionary *geo = [place objectForKey:@"geometry"];
        // Get the lat and long for the location.
        NSDictionary *loc = [geo objectForKey:@"location"];
        // 4 - Get your name and address info for adding to a pin.
        NSString *name=[place objectForKey:@"name"];
        NSString *vicinity=[place objectForKey:@"vicinity"];
        // Create a special variable to hold this coordinate info.
        CLLocationCoordinate2D placeCoord;
        // Set the lat and long.
        placeCoord.latitude=[[loc objectForKey:@"lat"] doubleValue];
        placeCoord.longitude=[[loc objectForKey:@"lng"] doubleValue];
        // 5 - Create a new annotation.
        Annotation *placeObject = [[Annotation alloc] initWithName:name address:vicinity coordinate:placeCoord];
        [mapView addAnnotation:placeObject];
    }
}



-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation 
{
    // Define your reuse identifier.
    static NSString *identifier = @"MapPoint";   
    
    if ([annotation isKindOfClass:[Annotation class]]) 
    {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) 
        {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else
        {
            annotationView.annotation = annotation;
        }
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = YES;
        return annotationView;
    }
    return nil;    
}


@end
