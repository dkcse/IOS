//
//  viewAnnotation.m
//  MapView
//
//  Created by Deepak Kumar on 22/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "viewAnnotation.h"

@implementation viewAnnotation
@synthesize titleLabel = _titleLabel;
@synthesize imageLabel = _imageLabel;
@synthesize subtitleLabel = _subtitleLabel;
@synthesize titleForSelectedPin = _titleForSelectedPin;
@synthesize address = _address;
@synthesize imageURL = _imageURL;
@synthesize dataForAnnotation = _dataForAnnotation;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
       
    }

    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleLabel.text = self.titleForSelectedPin;
	self.subtitleLabel.text = self.address;
    
    for (NSDictionary *place in self.dataForAnnotation)
    {
        if ([[place objectForKey:@"name"] isEqualToString:self.titleForSelectedPin])
        {
            NSString *urlString = [place objectForKey:@"icon"]; 
            NSURL *url = [NSURL URLWithString:urlString];
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
            [request setHTTPMethod:@"GET"];
            
            NSURLResponse *response = nil;
            NSError *error = nil;
            NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
            UIImage *resultImage = [UIImage imageWithData:(NSData *)result];
            self.imageLabel.image = resultImage;
        }
    }

}

- (void)viewDidUnload
{
    [self setTitleLabel:nil];
    [self setImageLabel:nil];
    [self setSubtitleLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)goBackToMapView:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

@end