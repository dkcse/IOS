//
//  tableViewViewController.h
//  tableView2
//
//  Created by Deepak Kumar on 23/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableViewViewController : UIViewController < UITableViewDataSource, UITableViewDelegate>

@property (copy,nonatomic) NSDictionary *multiMediaStuff;

@property (copy,nonatomic) NSDictionary *getInformationAboutLogAndContacts;

@property (copy,nonatomic) NSDictionary *browsing;

@property (copy,nonatomic) NSArray *sections;

@property (copy,nonatomic) NSArray *multiMediaImage;

@property (copy,nonatomic) NSArray *logImages;

@property (copy,nonatomic) NSArray *browsingImages;

@property (copy,nonatomic) NSArray *arrayForImages;


@end
