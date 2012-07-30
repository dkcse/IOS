//
//  DetailViewController.m
//  tableView2
//
//  Created by Deepak Kumar on 24/07/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "tableViewViewController.h"

@interface DetailViewController (Private)

- (void)customInitialize;
- (void)releaseAllViews;

@end

@implementation DetailViewController (Private)



- (void)customInitialize
{
    
}

- (void)releaseAllViews
{
    
}

@end



@implementation DetailViewController
@synthesize delegate;
@synthesize section=_section;
@synthesize row=_row;

@synthesize arrayForDescription=_arrayForDescription;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		[self customInitialize];
    }

    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

//#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    switch (self.section)
    {
        case 0:
            switch (self.row)
        {
                case 0:
                    self.arrayForDescription = [NSArray arrayWithObjects:@"Song1",@"song2",@"song3",@"song4", nil];
                    break;
                case 1:
                    self.arrayForDescription = [NSArray arrayWithObjects:@"g1",@"g2",@"g3",@"g4",@"g5", nil];
                    break;
                case 2:
                    self.arrayForDescription = [NSArray arrayWithObjects:@"g1",@"g2",@"g3",nil];
                    break;
                case 3:
                    self.arrayForDescription = [NSArray arrayWithObjects:@"g1",@"gc",@"g2",@"g3",@"g4", nil];
                default:
                    break;
            }
            break;
            
        case 1:
            switch (self.row) {
                case 0:
                    self.arrayForDescription= [NSArray arrayWithObjects:@"browsing",@"b2",@"b3",@"b4", nil];
                    break;
                case 1: 
                    self.arrayForDescription = [NSArray arrayWithObjects:@"b1",@"b2",@"b3",@"b4",@"b5",@"b6",nil];
                    break;
                case 2:
                    self.arrayForDescription = [NSArray arrayWithObjects:@"b1",@"b2",@"b3",@"b4",@"b5",@"b6",nil];
                    break;
                case 3:
                    self.arrayForDescription= [NSArray arrayWithObjects:@"b1",@"b2",@"b3",@"b4",@"b5",nil];
                    break;
                default:
                    break;
            }
        case 2:
            switch (self.row)
        {
            case 0:
                self.arrayForDescription= [NSArray arrayWithObjects:@"messaging",@"m2",@"m3",@"m4", nil];
                break;
            case 1: 
                self.arrayForDescription = [NSArray arrayWithObjects:@"messaging",@"m2",@"m3",@"m4",@"m5",@"m6",nil];
                break;
            case 2:
                self.arrayForDescription = [NSArray arrayWithObjects:@"messaging",@"m2",@"m3",@"m4",@"m5",@"m6",nil];
                break;
            case 3:
                self.arrayForDescription= [NSArray arrayWithObjects:@"messaging",@"m2",@"m3",@"m4",@"m5",nil];
                break;

                                 
                    
                default:
                    break;
            }
        default:
            break;
    }
    UITableView *myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
   
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.backgroundColor = [UIColor whiteColor];
    myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:myTableView];
    

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self releaseAllViews];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return [self.arrayForDescription count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellId = @"actionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    if (cell == nil) { 
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    } 
    cell.textLabel.text =[self.arrayForDescription objectAtIndex:indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{  
    UITableViewCell *cellNumber = [tableView cellForRowAtIndexPath:indexPath];
    
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"selected row has Data:" message:cellNumber.textLabel.text delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display Alert Message
    [messageAlert show];
    
     tableViewViewController *new = [[tableViewViewController alloc] init];
    [self presentModalViewController:new animated:YES];
    //[self.navigationController pushViewController:new animated:YES];
    
}


@end
