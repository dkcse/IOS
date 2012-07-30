//
//  tableViewViewController.m
//  tableView
//
//  Created by Deepak Kumar on 23/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "tableViewViewController.h"

@interface tableViewViewController ()

@end

@implementation tableViewViewController
@synthesize listOfItems = _listOfItems;
@synthesize descriptionOfItems = _descriptionOfItems;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.listOfItems = [NSArray arrayWithObjects: @"GALLERY",@"CONTACTS",@"LOG",@"INTERNET",@"MESSAGING",@"CALENDER",@"NOKIA STORE",@"MUSIC",@"MAPS",@"APPLICATION",@"HELP",@"SETTINGS",nil];
    
    self.descriptionOfItems = [NSArray arrayWithObjects: @"photos",@"phone_no",@"recent_calls",@"browsing",@"text",@"days",@"free_app",@"songs",@"location",@"information",@"search",@"manual",nil];
        
   
    
    UITableView *objTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    objTableView.delegate = self; 
    objTableView.dataSource = self; 
    objTableView.backgroundColor = [UIColor grayColor];

    objTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:objTableView];
     //self.navigationItem.title= @"MENUS";
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


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection: (NSInteger)section;
{
    return[self.listOfItems count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    return 60;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    static NSString *cellId = @"actionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [self.listOfItems objectAtIndex:indexPath.row]; 
    cell.detailTextLabel.text = [self.descriptionOfItems objectAtIndex:indexPath.row];
    
   
       return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"MENU_ITEM";
}
@end
