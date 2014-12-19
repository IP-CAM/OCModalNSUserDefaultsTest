//
//  SettingsViewController.m
//  OCModalNSUserDefaultsTest
//
//  Created by 麻生 拓弥 on 2014/12/19.
//  Copyright (c) 2014年 Takuya Aso. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self main_method];
}

-(void)main_method {
    
    // UserDefault 宣言
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // すでにテキストフィールドに入力されている場合
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"TextField_Status"] != nil) {
        
        // キーに登録されている文字列を抽出，表示
        NSString* value_string = [defaults stringForKey:@"TextField_Status"];
        _textField.text = value_string;
    }
    
    // UISwitch の値(初回起動など区別)
    // 初回起動
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"Switch_Status"] == nil) {
        _switchBtn.on = NO;
    } else {
        
        // キーに登録されているBOOL値を抽出，反映
        BOOL value_switch = [defaults boolForKey:@"Switch_Status"];
        if (value_switch == 1) {
            _switchBtn.on = YES;
        } else {
            _switchBtn.on = NO;
        }
    }
    
    // 値が変化(ユーザが変更)したら呼ばれる
    // TextFiled ver
    [_textField addTarget:self action:@selector(textFieldAction:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:_textField];
    
    // Switch ver
    [_switchBtn addTarget:self action:@selector(textFieldAction:)
         forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_switchBtn];
    
}

// テキストフィールドに入力(変化)された場合に呼ばれる
// 入力値をキーに保存
- (IBAction)textFieldAction:(id)sender {
    
    // UserDefault 宣言
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // TextField_Status というキーに入力された文字列を保存
    [defaults setObject:_textField.text forKey:@"TextField_Status"];
    
    // 値をすぐに反映させる
    [defaults synchronize];
}


// スイッチの値が変化したら呼ばれる
// 入力値をキーに保存
- (IBAction)switchAction:(id)sender {
    
    // UserDefault 宣言
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // スイッチがオンかオフか
    if(_switchBtn.on == YES) {
        // Switch_Status というキーにスイッチの状態を保存
        [defaults setBool:YES forKey:@"Switch_Status"];
    } else {
        // Switch_Status というキーに文字列を保存
        [defaults setBool:NO forKey:@"Switch_Status"];
    }
    // 値をすぐに反映させる
    [defaults synchronize];
}

// メイン画面に戻る
- (IBAction)backAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // キーボードを閉じる。
    [_textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
