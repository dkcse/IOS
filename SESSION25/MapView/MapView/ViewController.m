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
@synthesize internetConnection = _internetConnection; 
@synthesize annotationData = _annotationData;

-(void)viewDidLoad 
{
    [super viewDidLoad];
    self.mapView.delegate = self;     
    [self.mapView setShowsUserLocation:YES];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    _internetConnection = YES;
        
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

    if (self.firstLaunch)
    {
        region = MKCoordinateRegionMakeWithDistance(self.locationManager.location.coordinate,10000,10000);
        self.firstLaunch=NO;
    }
    else 
    {
        region = MKCoordinateRegionMakeWithDistance(centre,_currenDist,_currenDist);
    }
    [mView setRegion:region animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:NO];
    
    
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
    
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
        if(data == Nil)
        {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"REACHABILITY!"
                                                              message:@"Not Connected to internet"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            [message show];
            _internetConnection = NO;
        }
        else 
        {
            [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
        }

        });
}


-(void)fetchedData:(NSData *)responseData 
{
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:responseData                           
                          options:kNilOptions 
                          error:&error];

    NSArray* places = [json objectForKey:@"results"]; 
    _annotationData = places;
    [self plotPositions:places];
    self.annotationData = places;
    _internetConnection = YES;
     NSLog(@"Google Data: %@", places);
    
}


-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated 
{
    MKMapRect mRect = self.mapView.visibleMapRect;
    MKMapPoint eastMapPoint = MKMapPointMake(MKMapRectGetMinX(mRect), MKMapRectGetMidY(mRect));
    MKMapPoint westMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), MKMapRectGetMidY(mRect));
    
    self.currenDist = MKMetersBetweenMapPoints(eastMapPoint, westMapPoint);
    self.currentCentre = self.mapView.centerCoordinate;
}


-(void)plotPositions:(NSArray *)data
{
    for (id<MKAnnotation> annotation in mapView.annotations)
    {
        if ([annotation isKindOfClass:[Annotation class]]) 
        {
            [mapView removeAnnotation:annotation];
        }
    }
        for (int i=0; i<[data count]; i++) 
        {
        NSDictionary* place = [data objectAtIndex:i];
        NSDictionary *geo = [place objectForKey:@"geometry"];
        NSDictionary *loc = [geo objectForKey:@"location"];
        NSString *name=[place objectForKey:@"name"];
        NSString *vicinity=[place objectForKey:@"vicinity"];

        CLLocationCoordinate2D placeCoord;
        placeCoord.latitude=[[loc objectForKey:@"lat"] doubleValue];
        placeCoord.longitude=[[loc objectForKey:@"lng"] doubleValue];
            
        Annotation *placeObject = [[Annotation alloc] initWithName:name address:vicinity coordinate:placeCoord];
        [mapView addAnnotation:placeObject];
    }
}



-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation 
{
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
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        UIImageView *myImageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"open" ofType:@"jpg"]]];
        
		myImageView.frame = CGRectMake(0, 0, 30, 30);
		annotationView.leftCalloutAccessoryView = myImageView;
        return annotationView;
    }
    return nil;    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"Detail View"])
	{
		id <MKAnnotation> selectedAnnotation = [self.mapView.selectedAnnotations objectAtIndex:0];
        NSLog(@"selected annotation = %@",selectedAnnotation);
        
		[segue.destinationViewController setTitleForSelectedPin:[selectedAnnotation title]];
		[segue.destinationViewController setAddress:[selectedAnnotation subtitle]];
        [segue.destinationViewController setDataForAnnotation: self.annotationData];
	}
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
	[self performSegueWithIdentifier:@"Detail View" sender:self];
}


@end
