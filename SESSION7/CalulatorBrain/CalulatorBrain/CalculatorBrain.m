//
//  CalculatorBrain.m
//  CalulatorBrain
//
//  Created by Deepak Kumar on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()

@end


@implementation CalculatorBrain

@synthesize operandStack=_operandStack;

- (NSMutableArray *) operandStack
{
    if (_operandStack == nil)
	{
		_operandStack =[[NSMutableArray alloc] init];
	}

    return _operandStack;
}

- (void) pushOperand:(double) operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double) popOperand
{
    NSNumber *operandObject= [self.operandStack lastObject];

    if (operandObject)
	{
		[self.operandStack removeLastObject];	
	}

    return [operandObject doubleValue];
}

- (double) performOperation:(NSString *) operation
{
    double result = 0;
    
    if ([operation isEqualToString:@"+"])
    {
        result = [self popOperand] + [self popOperand];
    }
    else if([operation isEqualToString:@"-"])
    {
        double op1 =[self popOperand];
        double op2 =[self popOperand];
        
        result = op2 - op1;
    }
    else if ([operation isEqualToString:@"x"])
    {
        result = [self popOperand] * [self popOperand];
    }
    else if ([operation isEqualToString:@"/"])
    {
        double op1 = [self popOperand];
        double op2 = [self popOperand];
        
        result= op2 / op1;
    }

    else if ([operation isEqualToString:@"SQRT"])
    {
        result = sqrt([self popOperand]);
    }

    else if([operation isEqualToString:@"LOGe"])
    {
        result=log([self popOperand]);
    }
    else if([operation isEqualToString:@"COS"])
    {
        result=cos([self popOperand]);
    }
    else if([operation isEqualToString:@"SIN"])
    {
        result=sin([self popOperand]);
    }

    [self pushOperand:result];

    return result;
}

@end
