//
//  EquationTests.m
//  EquationTests
//
//  Created by 山崎 進 on 2012/12/12.
//  Copyright (c) 2012年 zacky1972. All rights reserved.
//

#import "EquationTests.h"
#import "Equation.h"

@implementation EquationTests

Equation* e;

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

// x^2 - 3x + 2 = 0 をテスト
// 実数解 2つの場合。
- (void)test1
{
    e = [[Equation alloc] initWithA:1 b:-3 c:2];
    
    // STAssertEqualsWithAccuracy は浮動小数点演算をテストするときに使います。
    // 浮動小数点演算では誤差が発生するので，誤差の範囲内で等しいことを確かめる必要があります。
    // accuracy とは誤差のことです。
    STAssertEqualsWithAccuracy(2.0, [e result1], 0.00001, @"result1 error");
    STAssertEqualsWithAccuracy(1.0, [e result2], 0.00001, @"result2 error");
}

@end
