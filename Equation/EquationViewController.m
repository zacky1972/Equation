//
//  EquationViewController.m
//  Equation
//
//  Created by 山崎 進 on 2012/12/12.
//  Copyright (c) 2012年 zacky1972. All rights reserved.
//

#import "EquationViewController.h"

#import <math.h>
#import "Equation.h"

@interface EquationViewController ()

@end

@implementation EquationViewController

@synthesize label1, label2;

@synthesize a,b,c;

- (double)result1
{
    Equation *e = [[Equation alloc] initWithA:a b:b c:c];
    return [e result1];
}

- (double)result2
{
    Equation *e = [[Equation alloc] initWithA:a b:b c:c];
    return [e result2];
}

// 2次方程式の解の公式を計算し，画面に表示します。
// 
// モデルとコントローラーが一体になったままの状態です。
// 解の公式をそのまま使って計算しています。
// 同じ計算を何度も行う無駄もあります。
//
// このままの状態ではソフトウェアテストを書けないので，
// まずはモデルとコントローラーを分離するリファクタリングを行います。
// (1-1) まず局所変数a,b,cをメンバー変数にします。
// こうすることでクラス中のどこからでも変数を参照できるようになり，
// メソッドの抽出を行いやすくなります。
// (1-2) 次にresult1, result2 の計算に対して，それぞれメソッドの抽出を行います。
// (1-3) 次にクラスの抽出を行います。メソッド result1, result2 を新たに作った Equation クラスに移動します。
// (1-4) 便利のため，イニシャライザを整備します。
//
// 次はテストコードを作成しましょう。
// (2-0) まずはテストを実行し，失敗することを確認します。
// (2-1) 次に EquatoinTests を書き換え test1 (1,-3,2)を作成します。
// (2-2) 次に test2 (1,2,1) を追加します。

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    a = 1;
    b = -3;
    c = 2;
    
    double result1 = [self result1];
    double result2 = [self result2];
    
    [label1 setText:[NSString stringWithFormat:@"%f", result1]];
    [label2 setText:[NSString stringWithFormat:@"%f", result2]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
