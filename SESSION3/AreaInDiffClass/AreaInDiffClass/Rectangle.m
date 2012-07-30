//
//  Rectangle.m
//  AreaInDiffClass
//
//  Created by Deepak Kumar on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle
@synthesize side1,side2;
-(void)calculateArea
{
    NSLog(@"area of rectangle is :%f\n",side1*side2);
}

@end
