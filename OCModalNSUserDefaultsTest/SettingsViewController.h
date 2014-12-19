//
//  SettingsViewController.h
//  OCModalNSUserDefaultsTest
//
//  Created by 麻生 拓弥 on 2014/12/19.
//  Copyright (c) 2014年 Takuya Aso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)textFieldAction:(id)sender;

@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;
- (IBAction)switchAction:(id)sender;

- (IBAction)backAction:(id)sender;


@end
