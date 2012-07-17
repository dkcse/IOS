//
//  shape.h
//  first
//
//  Created by Deepak Kumar on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject
{
}
- (void) calculateArea;
@end


@interface Circle : Shape
{
}
@property float radius;
-(void) calculateArea;
@end


@interface Square : Shape
{    
}
@property float side;
-(void) calculateArea;
@end


@interface Rectangle : Shape
{
}
@property float side1,side2;
-(void) calculateArea;
@end


@interface Rhombus : Shape
{
}
@property float side1,side2;
-(void) calculateArea;
@end



@interface Triangle : Shape
{
}
@property float side1,side2;
-(void) calculateArea;
@end





