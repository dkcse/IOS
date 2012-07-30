//
//  Square.m
//  AreaInDiffClass
//
//  Created by Deepak Kumar on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Square.h"

@implementation Square
@synthesize side;
-(void)calculateArea
{
    NSLog(@"area of square is :%f\n",side*side);
}

@end
