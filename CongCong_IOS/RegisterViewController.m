//
//  RegisterViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/13.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "RegisterViewController.h"
#import "AFNetWorking.h"
#import "SVProgressHUD.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    _regisPhone.borderStyle = UITextBorderStyleNone;
    _regisQua.borderStyle = UITextBorderStyleNone;
    _regisPass.borderStyle = UITextBorderStyleNone;
    for(int i =1 ;i<4 ;i++){
        UIView *view = (UIView *)[self.view viewWithTag:i];
        view.layer.cornerRadius = 3;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
 单击view，编辑结束
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (IBAction)registorMake:(id)sender {
    [SVProgressHUD showWithMaskType: SVProgressHUDMaskTypeBlack];
    [self performSelector:@selector(jumpToRegister) withObject:nil afterDelay:0.6];
}

- (void)jumpToRegister{
    [SVProgressHUD dismiss];
    _phoneNum = _regisPhone.text;
    _emailNum = _regisQua.text;
    _passNum = _regisPass.text;
    [self performSegueWithIdentifier:@"selfInfo" sender:nil];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"selfInfo"])
    {
        id theSegue = segue.destinationViewController;
        [theSegue setValue:_phoneNum forKey:@"phoneNum"];
        [theSegue setValue:_emailNum forKey:@"emailNum"];
        [theSegue setValue:_passNum forKey:@"passNum"];
    }
    
}


@end
