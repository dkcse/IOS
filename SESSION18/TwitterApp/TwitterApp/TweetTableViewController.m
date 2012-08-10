//
//  TweetTableViewController.m
//  TwitterApp
//
//  Created by Deepak Kumar on 09/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TweetTableViewController.h"

@interface TweetTableViewController (Private)


- (void)customInitialize;
- (void)releaseAllViews;

@end


@implementation TweetTableViewController (Private)

- (void)customInitialize
{
    
}

- (void)releaseAllViews
{
    
}

@end

#pragma mark -

@implementation TweetTableViewController

@synthesize myTableView = _myTableView;
@synthesize myIndexPath= _myIndexPath;
@synthesize imageData = _imageData;
@synthesize imageURL = _imageURL;

//changed

@synthesize tweetArrayOfDict = _tweetArrayOfDict;
//@synthesize tweetDictionary = _tweetDictionary;
@synthesize acAccount = _acAccount;
@synthesize acAccountStore = _acAccountStore;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
		[self customInitialize];
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
       [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //changed
    NSLog(@"called");
    self.tweetArrayOfDict = [[NSMutableArray alloc]init];
    [self fetchTweet];
    
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTweets:) name:@"Tweet Fetching Done" object:nil];
}

- (void)viewDidUnload
{
    [self setMyTableView:nil];
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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.tweetArrayOfDict.count;   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Tweet Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    NSDictionary *rowDictionary = [self.tweetArrayOfDict objectAtIndex:indexPath.row];
    cell.textLabel.text = [rowDictionary objectForKey:@"text"];
    cell.detailTextLabel.text = [[rowDictionary objectForKey:@"user"] objectForKey:@"name"];
   
    self.imageURL = [NSURL URLWithString:[[rowDictionary objectForKey:@"user"] objectForKey:@"profile_image_url"]];
    self.imageData= [NSData dataWithContentsOfURL:_imageURL];
    cell.imageView.image = [UIImage imageWithData:self.imageData];
           
    return cell;
    
}

//
//- (void) setTweets:(NSNotification *)notification
//{
//    NSDictionary *userInfo = [notification valueForKey:@"userInfo"];
//    self.tweetArray = [[NSArray alloc]initWithArray:[userInfo valueForKey:@"keyForArrayOfDictionary"]];
//    [self.tableView reloadData];
//   // self.navigationItem.leftBarButtonItem = self.refreshButton;
//    
//}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.myIndexPath = indexPath;
    NSLog(@"index path =%@",self.myIndexPath);
}


- (void ) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"called111");
   if ([segue.identifier isEqualToString:@"pushToDescription"])
   {
       NSDictionary *tweet = [self.tweetArrayOfDict objectAtIndex:[self.myTableView indexPathForSelectedRow].row];
       NSLog(@"tweet = %@",tweet);
       [segue.destinationViewController setUsrName:[[tweet objectForKey:@"user"]objectForKey:@"name"]];
       [segue.destinationViewController setTweetMessage:[tweet objectForKey:@"text"]];
       self.myIndexPath = [self.myTableView indexPathForSelectedRow];
       NSURL *imageURL = [NSURL URLWithString:[[tweet objectForKey:@"user"] objectForKey:@"profile_image_url"]];
       NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
       [segue.destinationViewController setImageContents:imageData];
    }
}

- (IBAction)refreshTable:(id)sender
{
    [self fetchTweet];
}



//changed

- (void)fetchTweet
{
    dispatch_async(dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        ACAccountStore *store = [[ACAccountStore alloc] init];
        ACAccountType *twitterAccountType = [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        [store requestAccessToAccountsWithType:twitterAccountType withCompletionHandler:^(BOOL granted, NSError *error)
         {
             if (!granted)
             {
                 NSLog(@"Access Denied By The User");
             } 
             else
             {
                 NSArray *twitterAccounts = [store accountsWithAccountType:twitterAccountType];
                 if ([twitterAccounts count] > 0)
                 {
                     ACAccount *account = [twitterAccounts objectAtIndex:0];
                     NSLog(@"%@",account);  
                     NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
                     [params setObject:@"1" forKey:@"include_entities"];
                     NSURL *url = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/home_timeline.json"];
                     
                     TWRequest *request = [[TWRequest alloc] initWithURL:url parameters:params requestMethod:TWRequestMethodGET];
                     [request setAccount:account];
                     [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                      {
                          
                          if (!responseData)
                          {
                              NSLog(@"%@", error);
                          } 
                          
                          else
                          {
                              NSError *jsonError;
                              self.tweetArrayOfDict= [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&jsonError];
                              NSLog(@"loading");
                              // NSLog(@"%@",self.tweetArrayOfDict);
                              if (self.tweetArrayOfDict)
                              {
                                  NSLog(@"tweetArray = %@",self.tweetArrayOfDict);
                                  NSLog(@"Tweets Copied to the Array");
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      [self.myTableView reloadData];
                                    });
                              } 
                              else
                              { 
                                  NSLog(@"%@", jsonError);
                              }
                          }
                      }];
                 }
             }
         }];
    
        });
    
}

@end