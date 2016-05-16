//
//  LoginViewController.h
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/13.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIImageView *groundImage;
- (IBAction)logIn:(id)sender;

@end
