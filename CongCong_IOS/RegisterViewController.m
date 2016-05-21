//
//  RegisterViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/13.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "RegisterViewController.h"
#import "AFNetWorking.h"

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
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSString *apiUrl = [plist objectForKey:@"apiUrl"];
    apiUrl = [apiUrl stringByAppendingString:@"/sign-up"];
    NSLog(@"%@",apiUrl);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: apiUrl]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    NSMutableDictionary *dictt = [NSMutableDictionary dictionary];
    dictt[@"nick_name"] = @"David";
    dictt[@"password"] = _regisPass.text;
    dictt[@"email"] = @"1111@qq.com";
    dictt[@"mobile"] = _regisPhone.text;
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [AFCompoundResponseSerializer serializer];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    [mgr POST:apiUrl parameters:dictt success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", operation.responseString);
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        NSDictionary *serializedData = [NSJSONSerialization JSONObjectWithData: errorData options:kNilOptions error:nil];
        NSLog(@"error--%@",serializedData);
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"%@",resData);

    }];
    [operation start];

}
@end
