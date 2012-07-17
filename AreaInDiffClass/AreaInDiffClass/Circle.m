//
//  Circle.m
//  AreaInDiffClass
//
//  Created by Deepak Kumar on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Circle.h"

@implementation Circle

@synthesize radius;
-(void)calculateArea
{
    NSLog(@"area of circle is :%f\n",M_PI*radius*radius);
}

@end
