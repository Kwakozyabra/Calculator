//
//  CalcButtons.m
//  MyNewCalculator
//
//  Created by Она on 16.02.2020.
//  Copyright © 2020 Она. All rights reserved.
//

#import "CalcButtons.h"

@implementation CalcButtons

- (void)awakeFromNim {
    [super awakeFromNib];
    self.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
    self.layer.borderWidth = 0.5;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = self.bounds.size.height/2;
}
@end

