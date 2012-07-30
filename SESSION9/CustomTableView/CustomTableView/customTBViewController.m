//
//  customTBViewController.m
//  CustomTableView
//
//  Created by Deepak Kumar on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "customTBViewController.h"
#import "customTBCell.h"


@implementation customTBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView *objTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    objTableView.delegate = self; 
    objTableView.dataSource = self; 
    objTableView.backgroundColor = [UIColor grayColor];
    
    objTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:objTableView];

	// Do any additional setup after loading the view, typically from a nib.
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"cell";
    customTBCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[customTBCell alloc] initWithFrame:CGRectZero] ;
    }
    
    // Set up the cell…
    switch (indexPath.row) {
        case 0:
            cell.primaryLabel.text = @"Contact Information";
            cell.secondaryLabel.text = @"Phone no";
            cell.myImageView.image = [UIImage imageNamed:@"contact.jpg"];
            break;
        case 1:
            cell.primaryLabel.text = @"Application";
            cell.secondaryLabel.text = @"Installed App";
            cell.myImageView.image = [UIImage imageNamed:@"app.jpg"];
            break;
        case 2:
            cell.primaryLabel.text = @"Gallery";
            cell.secondaryLabel.text = @"photo and video";
            cell.myImageView.image = [UIImage imageNamed:@"gallery.jpg"];
            break;
        case 3:
            cell.primaryLabel.text = @"Image Icon";
            cell.secondaryLabel.text = @"images";
            cell.myImageView.image = [UIImage imageNamed:@"image.jpg"];
            break;
        case 4:
            cell.primaryLabel.text = @"Game";
            cell.secondaryLabel.text = @"Play game";
            cell.myImageView.image = [UIImage imageNamed:@"game.jpg"];
            break;
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
@end
