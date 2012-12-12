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

@synthesize labelReal1, labelReal2, labelImaginary1, labelImaginary2;

@synthesize a,b,c;


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
// (2-3) 次に test3 (1,-2,-1) を追加します。
// (2-4) 次に test4 (1,2,1) を追加します。
// (2-5) わざとエラーになる test5 (1,2,1) を追加します。エラーになりません。
//
// 虚数解を正しく扱うために，実数部分と虚数部分を分離するようにプログラムを変更しましょう。
// (3-1) real1, real2 が実数部分を，imaginary1, imaginary2 が虚数部分を返すメソッドとしましょう。
//       最初は Equation.h に上記のメソッドを追加します。
//       実行すると警告が出ますが，最初のうちは無視しましょう。
// (3-2) 次に result1, result2 を使っているすべての場所を探すため，これらをコメントアウトしましょう。
//       エラーが出てビルドできなくなります。
// (3-3) エラーが出ている部分(result1,result2を使っている部分)を real1, real2, imaginary1, imaginary2 に置き換えます。
//       ビュー(MainStoryboard)も変更しましょう。
//       実行するとアボートします。
// (3-4) ようやく real1, real2, imaginary1, imaginary2 を実装します。
//       おや，テストコード test4, test5 が間違っているようです。
//       たしかに不正解の場合にテストでチェックできることが確かめられました。

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    a = 1;
    b = -3;
    c = 2;
    
    Equation *e = [[Equation alloc] initWithA:a b:b c:c];
    
    
    [labelReal1 setText:[NSString stringWithFormat:@"%f", [e real1]]];
    [labelReal2 setText:[NSString stringWithFormat:@"%f", [ e real2]]];
    [labelImaginary1 setText:[NSString stringWithFormat:@"%fi", [e imaginary1]]];
    [labelImaginary2 setText:[NSString stringWithFormat:@"%fi", [e imaginary2]]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
