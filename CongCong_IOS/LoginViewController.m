//
//  LoginViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/13.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "LoginViewController.h"
#import "SVProgressHUD.h"

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
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    [self performSelector:@selector(requestForLogin) withObject:nil afterDelay:0.6];
}

- (void)requestForLogin{
    NSArray *cookiesArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *cookie in cookiesArray) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSString *apiUrl = [plist objectForKey:@"apiUrl"];
    apiUrl = [apiUrl stringByAppendingString:@"/sign-in"];
    NSLog(@"%@",apiUrl);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: apiUrl]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    NSMutableDictionary *dictt = [NSMutableDictionary dictionary];
    dictt[@"identity"] = self.username.text;
    dictt[@"password"] =self.password.text;
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [AFCompoundResponseSerializer serializer];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    [mgr POST:apiUrl parameters:dictt success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", operation.responseString);
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        NSData *resData = [requestTmp dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        NSString *responceCode = [resultDic objectForKey:@"response_code"];
        if ([responceCode isEqualToString:@"4050"]) {
            [SVProgressHUD dismissWithSuccess:@"登录成功"];
            [self performSegueWithIdentifier:@"linkMain" sender:nil];
        }
        if ([responceCode isEqualToString:@"4033"]) {
            [SVProgressHUD dismissWithError:@"密码不正确！"];
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
    }];
    [operation start];

}

- (IBAction)jumpRegister:(id)sender {
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    [self performSelector:@selector(jumpWithSelector) withObject:nil afterDelay:0.8];
}

- (void)jumpWithSelector{
    [SVProgressHUD dismiss];
    [self performSegueWithIdentifier:@"jumpRegister" sender:nil];
}

@end
