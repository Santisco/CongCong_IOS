//
//  InfoViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/14.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "InfoViewController.h"
#import "AFNetWorking.h"
#import "SVProgressHUD.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameField.borderStyle = UITextBorderStyleNone;
    [_manBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [_womanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
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

- (IBAction)popBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)selectMan:(id)sender {
}

- (IBAction)selectWoman:(id)sender {
}

- (IBAction)finishRegister:(id)sender {
    [SVProgressHUD showWithMaskType: SVProgressHUDMaskTypeBlack];
    [self performSelector:@selector(requestForRegister) withObject:nil afterDelay:0.6];
}

- (void)requestForRegister{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSString *apiUrl = [plist objectForKey:@"apiUrl"];
    apiUrl = [apiUrl stringByAppendingString:@"/sign-up"];
    NSLog(@"%@",apiUrl);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: apiUrl]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    NSMutableDictionary *dictt = [NSMutableDictionary dictionary];
    dictt[@"nick_name"] = _nameField.text;
    dictt[@"password"] = _passNum;
    dictt[@"email"] = _emailNum;
    dictt[@"mobile"] = _phoneNum;
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [AFCompoundResponseSerializer serializer];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    [mgr POST:apiUrl parameters:dictt success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", operation.responseString);
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        NSData *resData = [requestTmp dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        NSString *judgeError = [resultDic objectForKey:@"error"];
        NSInteger boolError = [judgeError integerValue];
        if (boolError ==1) {
            NSArray *itemsArray = [resultDic valueForKey:@"data"];
            NSString *show = itemsArray[0];
            [SVProgressHUD dismissWithError:show];
        }
        //将unicode转为汉字！！！！！
        if (boolError ==0) {
            [SVProgressHUD dismissWithSuccess:@"注册成功"];
            [self performSegueWithIdentifier:@"solveRegister" sender:nil];
        }
        
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
    }];
    [operation start];
}

/*
 将unicode转为汉字！！！！
 */
- (NSString *)replaceUnicode:(NSString *)unicodeStr {
    
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    
    //NSLog(@"Output = %@", returnStr);
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
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
- (IBAction)backTap:(id)sender {
    [self.nameField resignFirstResponder];
}


@end
