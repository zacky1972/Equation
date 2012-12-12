//
//  Equation.m
//  Equation
//
//  Created by 山崎 進 on 2012/12/12.
//  Copyright (c) 2012年 zacky1972. All rights reserved.
//

#import "Equation.h"

@implementation Equation

@synthesize a,b,c;

- (id)initWithA:(double)_a b:(double)_b c:(double)_c
{
    self = [super init];
    if(self != nil) {
        a = _a;
        b = _b;
        c = _c;
    }
    return self;
}

- (double)real1
{
    if(b * b - 4 * a * c >= 0) {
        return (-b + sqrt(b * b - 4 * a * c))/(2*a);
    }
    return (-b)/(2*a);
}

- (double)real2
{
    if(b * b - 4 * a * c >= 0) {
        return (-b - sqrt(b * b - 4 * a * c))/(2*a);
    }
    return (-b)/(2*a);
}


- (double)imaginary1
{
    if(b * b - 4 * a * c >= 0) {
        return 0;
    }
    return (sqrt(-(b * b - 4 * a * c)))/(2*a);
}

- (double)imaginary2
{
    if(b * b - 4 * a * c >= 0) {
        return 0;
    }
    return -(sqrt(-(b * b - 4 * a * c)))/(2*a);
}

@end
