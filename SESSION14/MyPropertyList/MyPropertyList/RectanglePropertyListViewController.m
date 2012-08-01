//
//  RectanglePropertyListViewController.m
//  MyPropertyList
//
//  Created by Deepak Kumar on 01/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RectanglePropertyListViewController.h"

@interface RectanglePropertyListViewController (Private)

- (void)customInitialize;
- (void)releaseAllViews;

@end

@implementation RectanglePropertyListViewController (Private)

- (void)customInitialize
{
    
}

- (void)releaseAllViews
{
    
}

@end

#pragma mark -

@implementation RectanglePropertyListViewController
@synthesize rectanglePropertyList;
@synthesize rectangleDictionary = _rectangleDictionary;


- (void) setup
{
    NSString *errorDesc = nil;
	NSPropertyListFormat format;
	NSString *plistPath;
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
	plistPath = [rootPath stringByAppendingPathComponent:@"myPropertyList.plist"];
	if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
	{
		plistPath = [[NSBundle mainBundle] pathForResource:@"myPropertyList" ofType:@"plist"];
	}
	NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
	NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
										  propertyListFromData:plistXML
										  mutabilityOption:NSPropertyListMutableContainersAndLeaves
										  format:&format
										  errorDescription:&errorDesc];
	if (!temp)
	{
		NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
	}   
	temp = [temp objectForKey:@"Root"];
    NSLog(@"%@",temp);
	
	self.rectangleDictionary = [temp objectForKey:@"Rectangle"];
    NSLog(@"%@",self.rectangleDictionary);
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		[self setup];
    }

    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.rectanglePropertyList.text = [NSString stringWithFormat:@"%@",self.rectangleDictionary];
}

- (void)viewDidUnload
{
    [self setRectanglePropertyList:nil];
    [super viewDidUnload];
    [self releaseAllViews];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



@end