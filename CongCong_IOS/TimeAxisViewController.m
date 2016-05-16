//
//  TimeAxisViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/15.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "TimeAxisViewController.h"

@interface TimeAxisViewController ()

@end

@implementation TimeAxisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 按住按钮后没有松手的动画
    [_groundBtn addTarget:self action:@selector(scaleToSmall) forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    
    // 按住按钮松手后的动画
    [_groundBtn addTarget:self action:@selector(scaleAnimations) forControlEvents:UIControlEventTouchUpInside];
    [_groundBtn setTitleColor:[UIColor colorWithRed:0.89 green:0.96 blue:0.90 alpha:1] forState:UIControlStateHighlighted];
    [_groundBtn setTitleColor:[UIColor colorWithRed:0.21 green:0.48 blue:0.31 alpha:1] forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated{
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionCurveLinear animations:^{
        _ring1.transform = CGAffineTransformRotate(_ring1.transform, 180*(M_PI)/180);
        _ring2.transform = CGAffineTransformRotate(_ring2.transform, 180*(M_PI)/180);
        _ring3.transform = CGAffineTransformRotate(_ring3.transform, 180*(M_PI)/180);
    }completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scaleToSmall{
    _beneathBtn.backgroundColor =[UIColor colorWithRed:0.89 green:0.96 blue:0.90 alpha:1];

    _groundBtn.backgroundColor = [UIColor colorWithRed:0.21 green:0.48 blue:0.31 alpha:1];
    [_groundBtn.titleLabel setTextColor:[UIColor colorWithRed:0.89 green:0.96 blue:0.90 alpha:1]];
    [UIView animateWithDuration:0.4f animations:^{
        _groundBtn.transform = CGAffineTransformScale(_groundBtn.transform, 0.8, 0.8);
    }];
}

- (void)scaleAnimations{
    _beneathBtn.backgroundColor = [UIColor colorWithRed:0.21 green:0.48 blue:0.31 alpha:1];
    _groundBtn.backgroundColor = [UIColor colorWithRed:0.89 green:0.96 blue:0.90 alpha:1];
    [UIView animateWithDuration:0.2f animations:^{
        _groundBtn.transform = CGAffineTransformIdentity;
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)backTrack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
