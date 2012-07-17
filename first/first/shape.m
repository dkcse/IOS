//
//  shape.m
//  first
//
//  Created by Deepak Kumar on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "shape.h"

@implementation Shape
-(void)calculateArea{
}
@end

@implementation Circle

@synthesize radius;
-(void)calculateArea
{
    NSLog(@"area of circle is :%f\n",M_PI*radius*radius);
}
@end

@implementation Square

@synthesize side;
-(void)calculateArea
{
    NSLog(@"area of square is :%f\n",side*side);
}
@end


@implementation Rectangle

@synthesize side1,side2;
-(void)calculateArea
{
    NSLog(@"area of rectangle is :%f\n",side1*side2);
}
@end


@implementation Triangle

@synthesize side1,side2;
-(void)calculateArea
{
    NSLog(@"area of square is :%f\n",0.5*side1*side2);
}
@end



@implementation Rhombus

@synthesize side1,side2;
-(void)calculateArea
{
    NSLog(@"area of RHOMBUS is :%f\n",0.5*side1*side2);
}
@end
