//
//  LoginViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/13.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    _username.borderStyle = UITextBorderStyleNone;
    _password.borderStyle = UITextBorderStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 单击view，编辑结束
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

/*
 编辑结束关闭键盘
 */
- (IBAction)finishEdit:(id)sender {
    [sender resignFirstResponder];
    UITextField* text = (UITextField*)sender;
    [(UITextField*)[self.view viewWithTag:text.tag+1] becomeFirstResponder];
    
}
/*
 再次单击text结束编辑
 */
- (IBAction)backTap:(id)sender {
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logIn:(id)sender {
    if ([_username.text isEqualToString:@"wuguanlong"]&&[_password.text isEqualToString:@"123456"]) {
        //[self performSegueWithIdentifier:@"jumpToRegister" sender:nil];
    }
}
@end
