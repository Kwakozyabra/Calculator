//
//  CalcBrain.h
//  MyNewCalculator
//
//  Created by Она on 16.02.2020.
//  Copyright © 2020 Она. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalcBrain : NSObject

@property (nonatomic, assign) double operand;
@property (nonatomic, assign) double waitingOperand;
@property (nonatomic, copy) NSString *operator;


- (double)performComplexOperation;
- (double)performBinaryOperation;
- (void)clearAll;

@end
