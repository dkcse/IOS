//
//  tableViewViewController.h
//  tableView
//
//  Created by Deepak Kumar on 23/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableViewViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
 
}
@property NSMutableArray *listOfItems;
@property NSMutableArray *descriptionOfItems;

@end
