//
//  Triangle.m
//  AreaInDiffClass
//
//  Created by Deepak Kumar on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle

@synthesize side1,side2;
-(void)calculateArea
{
    NSLog(@"area of square is :%f\n",0.5*side1*side2);
}

@end
