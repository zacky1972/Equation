//
//  Equation.h
//  Equation
//
//  Created by 山崎 進 on 2012/12/12.
//  Copyright (c) 2012年 zacky1972. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Equation : NSObject

- (id)initWithA:(double)a b:(double)b c:(double)c;

@property double a;
@property double b;
@property double c;

-(double)result1;
-(double)result2;

-(double)real1;
-(double)real2;
-(double)imaginary1;
-(double)imaginary2;

@end
