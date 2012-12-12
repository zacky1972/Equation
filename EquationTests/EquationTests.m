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
    STAssertEqualsWithAccuracy(2.0, [e real1], 0.00001, @"real1 error");
    STAssertEqualsWithAccuracy(1.0, [e real2], 0.00001, @"real2 error");
    STAssertEqualsWithAccuracy(0.0, [e imaginary1], 0.00001, @"imaginary1 error");
    STAssertEqualsWithAccuracy(0.0, [e imaginary2], 0.00001, @"imaginary2 error");
}

// x^2 + 2x + 1 = 0 をテスト
// 実数解1つ(重解)の場合
- (void)test2
{
    e = [[Equation alloc] initWithA:1 b:2 c:1];
    
    STAssertEqualsWithAccuracy(-1.0, [e real1], 0.00001, @"real1 error");
    STAssertEqualsWithAccuracy(-1.0, [e real2], 0.00001, @"real2 error");
    STAssertEqualsWithAccuracy(0.0, [e imaginary1], 0.00001, @"imaginary1 error");
    STAssertEqualsWithAccuracy(0.0, [e imaginary2], 0.00001, @"imaginary2 error");
}

// test1, test2 について。
//
// このように異なる例を与えて動作を確かめます。
// テストで与える例のことをテストケースといいます。


// x^2 - 2x - 1 = 0 をテスト
// 実数解 2つの場合。
- (void)test3
{
    e = [[Equation alloc] initWithA:1 b:-2 c:-1];
    
    // STAssertEqualsWithAccuracy は浮動小数点演算をテストするときに使います。
    // 浮動小数点演算では誤差が発生するので，誤差の範囲内で等しいことを確かめる必要があります。
    // accuracy とは誤差のことです。
    STAssertEqualsWithAccuracy(1.0+sqrt(2.0), [e real1], 0.00001, @"real1 error");
    STAssertEqualsWithAccuracy(1.0-sqrt(2.0), [e real2], 0.00001, @"real2 error");
    STAssertEqualsWithAccuracy(0.0, [e imaginary1], 0.00001, @"imaginary1 error");
    STAssertEqualsWithAccuracy(0.0, [e imaginary2], 0.00001, @"imaginary2 error");
}

// test1, test3 について。
// 同じ「実数解2つ」の場合なので，
// どちらか一方で代表させれば構わないという考え方がありえます。
// このようなテストケースは同値クラスに属していると言います。
//
// 一方，観点を変えると同値クラスではなくなることもあります。
// test1 は整数解で，test3は無理数解だと考えると，
// 同値クラスではありません。
//
// 観点は無数にありうるので，すべての観点を網羅することは不可能です。
// ある観点をテストケースとして採用するかの判断基準は，
// 結果の差に意味があるかどうかだと思います。
// 今回のテスト対象 Equation は実装に実数を用いているので，
// test1 と test3 は同値クラスと考えていいのではないでしょうか。
// そういうわけで，test1 か test3 のどちらか一方で代表させてかまいません。




// x^2 + 2x + 1 = 0 をテスト
// 虚数解 2つの場合。
- (void)test4
{
    e = [[Equation alloc] initWithA:1 b:2 c:2];
    
    STAssertEqualsWithAccuracy(1.0, [e real1], 0.00001, @"real1 error");
    STAssertEqualsWithAccuracy(1.0, [e real2], 0.00001, @"real2 error");
    STAssertEqualsWithAccuracy(sqrt(2.0), [e imaginary1], 0.00001, @"imaginary1 error");
    STAssertEqualsWithAccuracy(-sqrt(2.0), [e imaginary2], 0.00001, @"imaginary2 error");
}

// ソフトウェアテストは同値クラスではないものを網羅的に行ったほうがいいです。
// 2次方程式の解の場合，実数解2つ，重解と来たので，次は虚数解2つでしょうね。
// 虚数解2つの場合として test4 を作ってみました。どうでしょう？ パスしましたか？
// 本当にこれでよかったんですかね？
//
// 試しにわざとエラーになるようにしてみましょう。
// 同じ式で期待値をわざと変えてみました。
- (void)testError
{
    e = [[Equation alloc] initWithA:1 b:2 c:2];
    
    STAssertEqualsWithAccuracy(5.0, [e real1], 0.00001, @"real1 error");
    STAssertEqualsWithAccuracy(5.0, [e real2], 0.00001, @"real2 error");
    STAssertEqualsWithAccuracy(sqrt(2.0), [e imaginary1], 0.00001, @"imaginary1 error");
    STAssertEqualsWithAccuracy(-sqrt(2.0), [e imaginary2], 0.00001, @"imaginary2 error");
}
// あれあれ？ テストにパスしてしまいますね。どうしてでしょう？

// 実は虚数や0で割り算した場合など，計算結果が実数で表せない値になってしまったとき
// nan という特殊な数値になります。
// それでテストがパスしてしまったのですね。
@end
