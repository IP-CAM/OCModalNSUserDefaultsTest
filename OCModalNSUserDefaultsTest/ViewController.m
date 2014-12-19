//
//  ViewController.m
//  OCModalNSUserDefaultsTest
//
//  Created by 麻生 拓弥 on 2014/12/19.
//  Copyright (c) 2014年 Takuya Aso. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 表示関係は全部 load 関数に任せる(自作)
    [self load];
}

// 設定画面から戻ってきたときに load 関数呼び出し
- (void) viewWillAppear:(BOOL)animated {
    
    NSLog(@"comemo");
    [self load];
}

-(void)load {
    
    // UserDefault 宣言
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // すでに設定でテキストフィールドに入力されている場合
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"TextField_Status"] != nil) {
        
        // キーに登録されている文字列を抽出，表示
        NSString* value_string = [defaults stringForKey:@"TextField_Status"];
        _stringLabel.text = value_string;
    } else {
        _stringLabel.text = @"NO DATA"; // 初回起動 or 未設定
    }
    
    // UISwitch の値(初回起動など区別)
    // 初回起動
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"Switch_Status"] == nil) {
        _boolLabel.text = @"NO DATA";  // 初回起動 or 未設定
    } else {
        
        // キーに登録されているBOOL値を抽出，反映
        BOOL value_switch = [defaults boolForKey:@"Switch_Status"];
        if (value_switch == 1) {
            _boolLabel.text = @"YES";
        } else {
            _boolLabel.text = @"NO";
        }
    }
}

// Settings ボタンが押されたとき modal_segue1 の遷移
- (IBAction)settingsAction:(id)sender {
    
    [self performSegueWithIdentifier:@"modal_segue1" sender:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
