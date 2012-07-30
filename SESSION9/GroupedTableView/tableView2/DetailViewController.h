//
//  DetailViewController.h
//  tableView2
//
//  Created by Deepak Kumar on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailViewControllerDelegate <NSObject>

- (void) selectedItem:(UIViewController *)controller dataSent:(NSString *)data;

@end



@interface DetailViewController : UIViewController//<UITableViewDelegate,UITableViewDataSource>
{
    id <DetailViewControllerDelegate> delegate;
}
@property (retain, nonatomic) id <DetailViewControllerDelegate> delegate;

@property (copy,nonatomic) NSArray *arrayForDescription;
@property NSInteger section;
@property NSInteger row;


@end
