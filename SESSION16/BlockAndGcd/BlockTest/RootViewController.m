//
//  RootViewController.m
//  BlockTest
//
//  Created by Deepak Kumar on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "PListDownloader.h"

@implementation RootViewController

@synthesize plistData = _plistData;

- (void)viewDidLoad
{
    [super viewDidLoad];
    PListDownloader *downloader = [[PListDownloader alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://www.icodeblog.com/samples/block_test/block_test.plist"];
    [downloader downloadPlistForURL:url completionBlock:^(NSArray *data, NSError *error) {
        self.plistData = data;
        if(!error) {
            dispatch_sync(dispatch_get_main_queue(), ^(void) {
                [self.tableView reloadData];
            });
        } else {
            NSLog(@"error %@", error);
        }
    }];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.plistData count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    cell.textLabel.text = [self.plistData objectAtIndex:indexPath.row];
    // Configure the cell.
    return cell;
}

@end
