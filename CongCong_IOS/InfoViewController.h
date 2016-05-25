//
//  InfoViewController.h
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/14.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *porButton;
- (IBAction)popBack:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIButton *manBtn;
@property (weak, nonatomic) IBOutlet UIButton *womanBtn;
@property (nonatomic,strong) NSString *phoneNum;
@property (nonatomic,strong) NSString *emailNum;
@property (nonatomic,strong) NSString *passNum;
- (IBAction)selectMan:(id)sender;
- (IBAction)selectWoman:(id)sender;
- (IBAction)finishRegister:(id)sender;

@end
