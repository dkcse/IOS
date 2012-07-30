//
//  ScrollArrayViewController.m
//  ScrollImageWithArray
//
//  Created by Deepak Kumar on 30/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScrollArrayViewController.h"

@interface ScrollArrayViewController() 

@property (strong,nonatomic) NSMutableArray *assetsArray;

@end


@implementation ScrollArrayViewController   

@synthesize myScrollView = _myScrollView;
@synthesize assetsArray = _assetsArray;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     ALAssetsLibrary *library = [[ALAssetsLibrary alloc ] init];
    
    [library enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if(group!= NULL) {
            [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                if(result!= NULL)
                {
                    [self.assetsArray addObject:result];
                }
                else
                    NSLog(@"NO PHOTO..!!");
            }];
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"ERROR..!!!");
    }];
    
    //////////////////////
    
    /*   void (^assetEnumerator)(struct ALAsset *, NSUInteger, BOOL *) = ^(ALAsset *result, NSUInteger index, BOOL *stop) {
     if(result != NULL) {
     NSLog(@"See Asset: %@", result);
     [self.assetsArray addObject:result];
     
     }
     };
     
     void (^assetGroupEnumerator)(struct ALAssetsGroup *, BOOL *) =  ^(ALAssetsGroup *group, BOOL *stop) {
     if(group != nil) {
     [group enumerateAssetsUsingBlock:assetEnumerator];
     }
     
     
     //        	[self.tableView reloadData];
     //      	[self.activity stopAnimating];
     //       	[self.activity setHidden:YES];
     };
     
     
     [library enumerateGroupsWithTypes:ALAssetsGroupAlbum
     usingBlock:assetGroupEnumerator
     failureBlock: ^(NSError *error) {
     NSLog(@"Failure");
     }];  */
    
    
    
    
    
    
    
    
    
    ////////////////
    
    NSLog(@"COUNT IS %u",[self.assetsArray count]);
    
    
    NSArray *imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],[UIImage imageNamed:@"5.jpg"],[UIImage imageNamed:@"6.jpg"],[UIImage imageNamed:@"7.jpg"],[UIImage imageNamed:@"8.jpg"],[UIImage imageNamed:@"9.jpg"],[UIImage imageNamed:@"10.jpg"],[UIImage imageNamed:@"11.jpg"],[UIImage imageNamed:@"12.jpg"],[UIImage imageNamed:@"13.jpg"],[UIImage imageNamed:@"14.jpg"], nil];
    
    self.myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.myScrollView.pagingEnabled = YES;
    
    for(int i=0;i<[imageArray count];i++)
    {
        CGFloat xOrigin = i*self.view.frame.size.width;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin,0,self.view.frame.size.width, self.view.frame.size.height)];
        imageView.image = [imageArray objectAtIndex:i];
        [self.myScrollView addSubview:imageView];
        
    }
    
    
    self.myScrollView.contentSize = CGSizeMake(self.view.frame.size.width * [imageArray count],self.view.frame.size.height);
    
    [self.view addSubview:self.myScrollView];
    
    
    
    
    
    
    
    
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
