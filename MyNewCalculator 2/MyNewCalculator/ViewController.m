//
//  ViewController.m
//  MyNewCalculator
//
//  Created by Она on 16.02.2020.
//  Copyright © 2020 Она. All rights reserved.
//

#import "CalcBrain.h"
#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *BinaryOperationsButtons;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *ComplecatedOperationsButtons;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *FiguresButtons;
@property (nonatomic, assign, getter=isInTextInputComma) BOOL isInTextInputComma;
@property (nonatomic, assign, getter=isInTextInputMode) BOOL inTextInputMode;
@property (nonatomic, assign, getter=isInTextInputFirstSymbol) BOOL isInTextInputFirstSymbol;
@property (nonatomic, assign, getter=isInTextInputFirstOperation) BOOL isInTextInputFirstOperation;
@property (nonatomic, strong) CalcBrain *brain;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self clear];
    
}

- (IBAction)buttonWithDigitDidTap:(UIButton *)button {
    NSString *digit = button.titleLabel.text;
    if (self.isInTextInputMode) {
        if([digit isEqualToString: @"pi"]){
            self.resultLabel.text = @"3.14";
            self.inTextInputMode = NO;
            self.isInTextInputComma = NO;
            self.isInTextInputFirstSymbol = NO;
        }else{
            if(self.isInTextInputComma){
                if(self.isInTextInputFirstSymbol){
                    if([digit isEqualToString: @","]){
                        self.resultLabel.text = [self.resultLabel.text stringByAppendingString:@"."];
                        self.isInTextInputComma = NO;
                        self.isInTextInputFirstSymbol = NO;
                    }else{
                        self.resultLabel.text = digit;
                        self.isInTextInputFirstSymbol = NO;
                    }
                }else{
                    if([digit isEqualToString: @","]){
                        self.isInTextInputComma = NO;
                        self.resultLabel.text = [self.resultLabel.text stringByAppendingString:@"."];
                    }else{
                        self.resultLabel.text = [self.resultLabel.text stringByAppendingString:digit];
                    }
                }
            }else{
                if([digit isEqualToString: @","]){
                    self.isInTextInputComma = NO;
                }else{
                    self.resultLabel.text = [self.resultLabel.text stringByAppendingString:digit];
                }
            }
        }
    }else {
        if([digit isEqualToString: @"pi"]){
            self.resultLabel.text = @"3.14";
        } else{
            if(self.isInTextInputComma){
                if(self.isInTextInputFirstSymbol){
                    if([digit isEqualToString: @","]){
                        self.resultLabel.text = [self.resultLabel.text stringByAppendingString:@"."];
                        self.isInTextInputComma = NO;
                        self.isInTextInputFirstSymbol = NO;
                    }else{
                        self.resultLabel.text = digit;
                        self.isInTextInputFirstSymbol = NO;
                        self.inTextInputMode = YES;
                    }
                }
            }
        }
    }
}
// при выполнении операции должна быть рекурсия
// 1. не понимаю, как вызвать функцию внутри функции
// 2. как в рекурсии прописать остановку через нажатие равно

- (IBAction)buttonWithOperationDidTap:(UIButton *)button {
    NSString *operator = button.titleLabel.text;
    //if (self.isInTextInputFirstOperation){
        self.brain.operator = operator;
        self.brain.waitingOperand = [self displayValue];
    //    self.isInTextInputFirstOperation = NO;
    /*}else{
        self.brain.operand = [self displayValue];
        self.brain.operator = operator;
        self.brain.waitingOperand = [self.brain performBinaryOperation];
        double result = self.brain.waitingOperand;
        [self setResult:result];
    }*/

    self.inTextInputMode = NO;
    self.isInTextInputComma = YES;
    self.isInTextInputFirstSymbol = YES;
}

- (IBAction)performOperationButtonDidTap:(UIButton *)button {
    self.brain.operand = [self displayValue];
    double result = [self.brain performBinaryOperation];
    [self setResult:result];
}

- (CalcBrain *)brain {
    if (!_brain) {
        _brain = [[CalcBrain alloc] init];
    }
    return _brain;
}

- (double)displayValue {
    return self.resultLabel.text.doubleValue;
}

- (void)clear {
    //[self.brain clearAll];
    self.inTextInputMode = YES;
    self.isInTextInputComma = YES;
    self.isInTextInputFirstSymbol = YES;
    self.isInTextInputFirstOperation = YES;
}

- (void)setResult:(double)result {
    self.resultLabel.text = [NSString stringWithFormat:@"%g", result];
    self.inTextInputMode = NO;
}



@end
