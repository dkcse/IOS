//
//  CalculatorBrain.h
//  CalulatorBrain
//
//  Created by Deepak Kumar on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

@property (nonatomic,strong) NSMutableArray *operandStack;

- (void) pushOperand:(double) oprand;

- (double) performOperation:(NSString *) operation;

@end
