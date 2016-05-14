//
//  InfoViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/14.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "InfoViewController.h"

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
