//
//  FlickrPhotoViewController.m
//  FlickrPhoto
//
//  Created by Deepak Kumar on 02/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlickrPhotoViewController.h"
#import "FullScreenImage.h"

#define URL @"http://www.flickr.com/services/rest/?method=flickr.interestingness.getList&format=json&api_key=aa621a9050ef8dfbd9621cc311da86aa"

@implementation FlickrPhotoViewController

@synthesize imageTableView = _imageTableView;
@synthesize Titles         = _Titles;
@synthesize SmallImageData = _SmallImageData;
@synthesize URLsLargeImage = _URLsLargeImage;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mQueue = [[NSOperationQueue alloc] init];
    FlickrOperation *operation = [[FlickrOperation alloc]init];
    operation.delegate = self;
    [mQueue addOperation:operation];
    
    self.imageTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.imageTableView.delegate = self; 
    self.imageTableView.dataSource = self; 
    self.imageTableView.rowHeight = 80;
    self.imageTableView.backgroundColor = [UIColor underPageBackgroundColor];
    self.imageTableView.separatorStyle =  UITableViewCellSeparatorStyleSingleLineEtched;
    [self.view addSubview:self.imageTableView];
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


- (void)sendTitle:(NSMutableArray *)titles smallImageData:(NSMutableArray *)smallImageData LargeImageData:(NSMutableArray *)largeImageData
{ 
    self.Titles = titles;
    self.SmallImageData = smallImageData;
    self.URLsLargeImage = largeImageData;
    [self.imageTableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection: (NSInteger)section 
{
    return [self.Titles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"actionCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    if (cell == nil)
    { 
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId]; 
    }
    
    cell.textLabel.text = [self.Titles objectAtIndex:indexPath.row];
    NSData *imageData = [self.SmallImageData objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageWithData:imageData];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FullScreenImage *new = [[FullScreenImage alloc] init];
    new.imageUrl = [self.URLsLargeImage objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:new animated:YES];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"FLICKR PHOTO...";
}

@end
