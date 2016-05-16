//
//  MainViewController.h
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/14.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *timeBtn;
@property (weak, nonatomic) IBOutlet UIButton *mainBtn;
@property (weak, nonatomic) IBOutlet UIButton *selfBtn;

@property (weak, nonatomic) IBOutlet UIButton *teachBtn;
- (IBAction)teachPress:(id)sender;

@end
