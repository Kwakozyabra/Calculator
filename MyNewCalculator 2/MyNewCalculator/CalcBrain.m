//
//  CalcBrain.m
//  MyNewCalculator
//
//  Created by Она on 16.02.2020.
//  Copyright © 2020 Она. All rights reserved.
//

#import "CalcBrain.h"
#include "math.h"

@implementation CalcBrain

double result = 0;


- (void)clearAll {
    //do smth here
    if ([self.operator isEqualToString:@"AC"]) {
        result = 0;
    }
}

- (double)performComplexOperation {
    //do smth here
    if([self.operator isEqualToString:@"sqrt"]){
        result = sqrt(self.waitingOperand);
    }
    return result;
}

- (double)performBinaryOperation {
    //double result = 0;
    if ([self.operator isEqualToString:@"+"]) {
        result = self.waitingOperand + self.operand;
    } else if ([self.operator isEqualToString:@"-"]) {
        result = self.waitingOperand - self.operand;
    } else if ([self.operator isEqualToString:@"×"]) {
        result = self.waitingOperand * self.operand;
    } else if ([self.operator isEqualToString:@"÷"]) {
        if (self.operand != 0) {
            result = self.waitingOperand / self.operand;
        }
    }
    
    return result;
}

@end
