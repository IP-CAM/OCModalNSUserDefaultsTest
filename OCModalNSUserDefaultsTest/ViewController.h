//
//  ViewController.h
//  OCModalNSUserDefaultsTest
//
//  Created by 麻生 拓弥 on 2014/12/19.
//  Copyright (c) 2014年 Takuya Aso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *stringLabel;
@property (weak, nonatomic) IBOutlet UILabel *boolLabel;

@property (weak, nonatomic) IBOutlet UIButton *settingsBtn;
- (IBAction)settingsAction:(id)sender;

@end

