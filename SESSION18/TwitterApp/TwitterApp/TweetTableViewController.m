//
//  TweetTableViewController.m
//  TwitterApp
//
//  Created by Deepak Kumar on 09/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TweetTableViewController.h"
#import "Tweet.h"
#import "User.h"
#import <SystemConfiguration/SystemConfiguration.h>

@implementation TweetTableViewController

@synthesize activitySpinner = _activitySpinner;
@synthesize myTableView = _myTableView;
@synthesize myIndexPath= _myIndexPath;
@synthesize imageData = _imageData;
@synthesize imageURL = _imageURL;
@synthesize reachability = _reachability;
@synthesize refreshButton = _refreshButton;
@synthesize tweetArrayOfDict = _tweetArrayOfDict;
@synthesize acAccount = _acAccount;
@synthesize acAccountStore = _acAccountStore;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
		
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
    self.tweetArrayOfDict = [[NSMutableArray alloc]init];
    self.tableView.rowHeight = 60;
    self.activitySpinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.activitySpinner startAnimating];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.activitySpinner];

    [self fetchTweet];
    
}

- (void)viewDidUnload
{
    [self setMyTableView:nil];
    [self setRefreshButton:nil];
    [super viewDidUnload];
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
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
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
    if(!self.reachability)
    {
        Tweet *tweetInNoNetwork = [self.tweetArrayOfDict objectAtIndex:indexPath.row];
        cell.textLabel.text = [tweetInNoNetwork valueForKeyPath:@"userIdentity.userName"];
        cell.detailTextLabel.text = [tweetInNoNetwork valueForKey:@"tweetMessage"];
        cell.imageView.image = [UIImage imageWithData:[tweetInNoNetwork valueForKeyPath:@"UserIdentity.userImage"]];
    }
    else
    {
        NSDictionary *rowDictionary = [self.tweetArrayOfDict objectAtIndex:indexPath.row];
        cell.textLabel.text = [rowDictionary objectForKey:@"text"];
        cell.detailTextLabel.text = [[rowDictionary objectForKey:@"user"] objectForKey:@"name"];
        self.imageURL = [NSURL URLWithString:[[rowDictionary objectForKey:@"user"] objectForKey:@"profile_image_url"]];
        self.imageData= [NSData dataWithContentsOfURL:_imageURL];
        cell.imageView.image = [UIImage imageWithData:self.imageData];
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.myIndexPath = indexPath;
}

- (void ) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pushToDescription"])
    {
        if([self reachability])
        {
            
            DetailViewController *nextController = [segue destinationViewController];
            nextController.reachable = YES;
            NSDictionary *tweet = [self.tweetArrayOfDict objectAtIndex:[self.myTableView indexPathForSelectedRow].row];
            [segue.destinationViewController setUsrName:[[tweet objectForKey:@"user"]objectForKey:@"name"]];
            [segue.destinationViewController setTweetMessage:[tweet objectForKey:@"text"]];
            
            self.myIndexPath = [self.myTableView indexPathForSelectedRow];
            NSURL *imageURL = [NSURL URLWithString:[[tweet objectForKey:@"user"] objectForKey:@"profile_image_url"]];
            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
            [segue.destinationViewController setImageContents:imageData];
        }
        else 
        {
            NSUInteger selectedRow = [self.tableView indexPathForSelectedRow].row;
            NSManagedObject *selectedObject = [self.tweetArrayOfDict objectAtIndex:selectedRow];
            DetailViewController *nextController = [segue destinationViewController];
            nextController.selectedTweet = selectedObject;
            nextController.reachable = NO;
            
        }
        
    }
}

- (IBAction)refreshTable:(id)sender
{
    //self.activitySpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.activitySpinner startAnimating];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.activitySpinner];
    [self fetchTweet];
    
}


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
                     NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
                     [params setObject:@"1" forKey:@"include_entities"];
                     [params setObject:@"20" forKey:@"count"];
                     NSURL *url = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/home_timeline.json"];
                     
                     TWRequest *request = [[TWRequest alloc] initWithURL:url parameters:params requestMethod:TWRequestMethodGET];
                     [request setAccount:account];
                     [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                      {
                          if (!responseData)
                          {
                              self.reachability = NO;
                              twitAppDelegate *appDelegate = (twitAppDelegate *)[[UIApplication sharedApplication] delegate];
                              NSManagedObjectContext *context = [appDelegate managedObjectContext];
                              [self fetchFromCoredataWithContext:context];
                          } 
                          
                          else
                          {
                              NSError *jsonError;
                              self.reachability = YES;
                              self.tweetArrayOfDict= [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&jsonError];
                              
                              if (self.tweetArrayOfDict)
                              {
                                  NSLog(@"Tweets Copied to the Array");
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      [self.myTableView reloadData];
                                  });
                              } 
                              else
                              { 
                                  NSLog(@"%@", jsonError);
                              }
                              [self deleteAllEntities];
                              [self addToCoreData:self.tweetArrayOfDict];
                          }
                      }];
                    
                 }
             }
         }];
            });
}


- (void) deleteAllEntities
{
    NSError *error;
    twitAppDelegate *appDelegate = (twitAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityUser = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    NSEntityDescription *entityTweet = [NSEntityDescription entityForName:@"Tweet" inManagedObjectContext:context];
    [fetchRequest setEntity:entityUser];
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *user in fetchedObjects) 
    {
        [context deleteObject:user];
    }
    [fetchRequest setEntity:entityTweet];
    fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *tweet in fetchedObjects) 
    {
        [context deleteObject:tweet];
    }
}

- (void) addToCoreData:(NSArray *)tweets
{
    twitAppDelegate *appDelegate = (twitAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    __block NSMutableArray *userNames = [[NSMutableArray alloc]init];
    __block NSMutableDictionary *userDict = [[NSMutableDictionary alloc]init];
    __block NSError *error;
    
    [tweets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) 
     {
         NSDictionary *tweet = obj;
         NSString *name = [[tweet objectForKey:@"user"] objectForKey:@"name"];
         NSString *imageurl = [[tweet objectForKey:@"user"] objectForKey:@"profile_image_url"];
         NSString *dateCreated   = [tweet objectForKey:@"created_at"];
         
         Tweet *tweetObj = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet" inManagedObjectContext:context];
         tweetObj.tweetMessage = [tweet objectForKey:@"text"];
         tweetObj.dateCreated = dateCreated;
         tweetObj.tweetID = [tweet objectForKey:@"id"];
         
         if(![userNames containsObject:name])
         {
             User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
             [user addUserTweetObject:tweetObj];
             user.userName = name;
             NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageurl]];
             user.userImage = imageData;
             [userNames addObject:name];
             [userDict setValue:user forKey:name];
             tweetObj.userIdentity = user;            
         }
         else
         {
             tweetObj.userIdentity = [userDict objectForKey:name];
         }
         if (![context save:&error]) 
         {
             NSLog(@"Whoops, couldn't save:%@",[error localizedDescription]);
         }
     }];                                    
    self.navigationItem.leftBarButtonItem = self.refreshButton;
    if(![self reachability])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No Internet Connection" message:@"Fetching older tweets from database" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [self fetchFromCoredataWithContext:context]; 
    }
}


- (void) fetchFromCoredataWithContext:(NSManagedObjectContext *)context
{
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tweet" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedResults = [context executeFetchRequest:fetchRequest error:&error];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.tweetArrayOfDict = fetchedResults;
        NSLog(@"Tweets are:  %@",self.tweetArrayOfDict);
        [self.tableView reloadData];
        self.navigationItem.leftBarButtonItem = self.refreshButton;
    });
    
}

@end