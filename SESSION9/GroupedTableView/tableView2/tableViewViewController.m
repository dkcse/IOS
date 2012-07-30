//
//  tableViewViewController.m
//  tableView2
//
//  Created by Deepak Kumar on 23/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "tableViewViewController.h"
#import "DetailViewController.h"

@interface tableViewViewController ()

@end

@implementation tableViewViewController
@synthesize multiMediaStuff=_multiMediaStuff;
@synthesize browsing=_browsing;
@synthesize getInformationAboutLogAndContacts=_getInformationAboutLogAndContacts;
@synthesize sections=_sections;


@synthesize multiMediaImage=_multiMediaImage;
@synthesize logImages=_logImages;
@synthesize browsingImages=_browsingImages;
@synthesize arrayForImages=_arrayForImages;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.multiMediaStuff= [NSDictionary dictionaryWithObjectsAndKeys:@"GALLERY",@"Photo And Video",@"MUSIC",@"Listen Song",@"APPLICATION",@"Installed App",nil];
    self.browsing = [NSDictionary dictionaryWithObjectsAndKeys:@"INTERNET",@"Browse Net",@"NOKIA STORE",@"Nokis Apps",@"OVI STORE",@"Available Apps",nil];
    self.getInformationAboutLogAndContacts = [NSDictionary dictionaryWithObjectsAndKeys:@"CONTACTS",@"Phone_no",@"LOG",@"Call",@"MESSAGING",@"Inbox",nil];
    
    self.sections = [NSArray arrayWithObjects:self.multiMediaStuff,self.browsing,self.getInformationAboutLogAndContacts,nil];
    
    self.multiMediaImage = [NSArray arrayWithObjects:@"gallery.jpg",@"music.jpg",@"app.jpg",nil];
    self.logImages = [NSArray arrayWithObjects:@"internet.jpg",@"nokia.jpg",@"ovi.jpg",nil];
    self.browsingImages = [NSArray arrayWithObjects: @"contact.jpg",@"image.jpg",@"game.jpg",nil];
    
    self.arrayForImages = [NSArray arrayWithObjects: self.multiMediaImage,self.browsingImages,self.logImages,nil];
    
    
    
    
    UITableView *myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.backgroundColor = [UIColor whiteColor];
    myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:myTableView];
    


	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

//-(NSInteger)tableView:(UITableView *)tableViewNumberOfRowsInSection:(NSInteger)section
//{
////NSArray *sectionNo = [self.sections objectAtIndex:section];
////NSInteger rows = [sectionNo count];
//
//return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray *sectionNo = [self.sections objectAtIndex:section];
    NSInteger rows = [sectionNo count];

    return rows;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{    
    return [self.sections count];
}




- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"MULTIMEDIA STUFF";
    }
    else if (section == 1)
    {
        return @"BROWSING";
    }
    else if (section == 2)
    {
        return @"HELP";
    }

    else
    return @"Invalid title for header";
}




- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Multomedia Footer";
    }
    else if (section == 1)
    {
        return @"Browsing Footer";
    }
    else if(section==2)
    {
       return @"Help Footer"; 
    }
    else 
    return @"Invalid title for footer";
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellData = @"actionData";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellData];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellData];
    }
   
    NSDictionary *menu= [self.sections objectAtIndex : indexPath.section];
    
    NSArray *keys = [menu allKeys];
    NSArray *values = [menu allValues];
    

    NSArray *tempArray = [self.arrayForImages objectAtIndex:indexPath.section];
    //cell.backgroundColor = [UIColor Color];
    cell.textLabel.text = [values objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [keys objectAtIndex:indexPath.row];
    
        
    cell.imageView.image = [UIImage imageNamed:[tempArray objectAtIndex:indexPath.row]];
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{  
        
     DetailViewController *new = [[DetailViewController alloc] init];
   //new.setvalues
    [self presentModalViewController:new animated:YES];
        
}

@end


