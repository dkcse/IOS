//
//  customTBCell.m
//  CustomTableView
//
//  Created by Deepak Kumar on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "customTBCell.h"
//#import "customTBViewController.h"

@implementation customTBCell
@synthesize primaryLabel=_primaryLabel;
@synthesize secondaryLabel=_secondaryLabel;
@synthesize myImageView=_myImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
         self.primaryLabel= [[UILabel alloc]init];
        self.primaryLabel.textAlignment = UITextAlignmentLeft;
        self.primaryLabel.font = [UIFont systemFontOfSize:16];
        self.secondaryLabel = [[UILabel alloc]init];
        self.secondaryLabel.textAlignment = UITextAlignmentRight;
        self.secondaryLabel.font = [UIFont systemFontOfSize:10];
        self.myImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.primaryLabel];
        [self.contentView addSubview:self.secondaryLabel];
        [self.contentView addSubview:self.myImageView];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    frame= CGRectMake(boundsX+10 ,0, 60, 60);
    self.myImageView.frame = frame;
    
    frame= CGRectMake(boundsX+80 ,5, 200, 25);
    self.primaryLabel.frame = frame;
    
    frame= CGRectMake(boundsX+80 ,30, 100, 25);
    self.secondaryLabel.frame = frame;
}

@end