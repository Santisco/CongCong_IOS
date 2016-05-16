//
//  TimeAxisViewController.h
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/15.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeAxisViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *groundBtn;
@property (weak, nonatomic) IBOutlet UIButton *beneathBtn;
@property (weak, nonatomic) IBOutlet UIView *ring1;
@property (weak, nonatomic) IBOutlet UIView *ring2;
@property (weak, nonatomic) IBOutlet UIView *ring3;
- (IBAction)backTrack:(id)sender;


@end
