//
//  RegisterViewController.h
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/13.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
- (IBAction)goBack:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *regisPhone;
@property (weak, nonatomic) IBOutlet UITextField *regisQua;
@property (weak, nonatomic) IBOutlet UITextField *regisPass;

@end
