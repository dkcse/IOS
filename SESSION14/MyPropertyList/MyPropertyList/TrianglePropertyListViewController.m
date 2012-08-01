//
//  TrianglePropertyListViewController.m
//  MyPropertyList
//
//  Created by Deepak Kumar on 01/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TrianglePropertyListViewController.h"

@interface TrianglePropertyListViewController (Private)

- (void)customInitialize;
- (void)releaseAllViews;

@end

@implementation TrianglePropertyListViewController (Private)

- (void)customInitialize
{
    
}

- (void)releaseAllViews
{
    
}

@end

#pragma mark -

@implementation TrianglePropertyListViewController

@synthesize triangleDictionary = _triangleDictionary;
@synthesize triangleProperty;

- (void) setup
{   
    //self.triangleDictionary = [[NSDictionary alloc]init];
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

	
	self.triangleDictionary = [temp objectForKey:@"Triangle"];
    NSLog(@"%@",self.triangleDictionary);

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		[self setup];
    }

    return self;
}


- (void) awakeFromNib
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
     self.triangleProperty.text = [NSString stringWithFormat:@"%@",self.triangleDictionary];
   // NSLog(@"%@",self.triangleDictionary);
}

- (void)viewDidUnload
{
    [self setTriangleProperty:nil];
    [super viewDidUnload];
    [self releaseAllViews];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end