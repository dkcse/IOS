//
//  MainPage.m
//  TwitterApp
//
//  Created by Deepak Kumar on 08/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MainPage.h"
#import "TweetTableViewController.h"

@interface MainPage (Private)

- (void)customInitialize;
- (void)releaseAllViews;

@end

@implementation MainPage

@synthesize tweetArrayOfDict = _tweetArrayOfDict;
@synthesize tweetDictionary = _tweetDictionary;
@synthesize acAccount = _acAccount;
@synthesize acAccountStore = _acAccountStore;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
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
    self.tweetArrayOfDict = [[NSMutableArray alloc]init];
    self.tweetDictionary = [[NSDictionary alloc]init];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self releaseAllViews];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


- (IBAction)sendTweet:(id)sender
{
    
}



- (void ) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{ 
    if([segue.identifier isEqualToString:@"tableViewSegue"])
    {
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
                    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                         
                if (!responseData)
                         {
                             NSLog(@"%@", error);
                         } 
                                                
                else
                        {
                            NSError *jsonError;
                            self.tweetArrayOfDict = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&jsonError];
                            
                  if (self.tweetArrayOfDict)
                     {
                        NSDictionary *dictionaryToPass = [[NSDictionary alloc]initWithObjectsAndKeys:self.tweetArrayOfDict,@"keyForArrayOfDictionary",nil];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"Tweet Fetching Done" object:dictionaryToPass userInfo:dictionaryToPass];
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
        
  }
}

@end