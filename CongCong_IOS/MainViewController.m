//
//  MainViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/14.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController (){
     BOOL clicked;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    clicked = YES;
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    clicked =YES;
    _mainBtn.transform = CGAffineTransformIdentity;
    _selfBtn.transform = CGAffineTransformIdentity;
    _timeBtn.transform = CGAffineTransformIdentity;
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

- (IBAction)teachPress:(id)sender {
    if(clicked ==YES){
        [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint accountCenter = _mainBtn.center;
            accountCenter.y -= 80;
            _mainBtn.center = accountCenter;
            CGPoint accountCenter1 = _selfBtn.center;
            accountCenter1.x += 80;
            _selfBtn.center = accountCenter1;
            CGPoint accountCenter2 = _timeBtn.center;
            accountCenter2.x += 57;
            accountCenter2.y -= 57;
            _timeBtn.center = accountCenter2;
        }completion:nil];
       /* [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionTransitionNone animations:
         ^{
             CGPoint accountCenter = _teachBtn.center;
             accountCenter.y -= 200;
             _teachBtn.center = accountCenter;
        }
                         completion:nil];*/
    
        [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionTransitionNone  animations:^{
            _mainBtn.transform = CGAffineTransformScale(_mainBtn.transform, 1.6 , 1.6);
            _selfBtn.transform = CGAffineTransformScale(_selfBtn.transform, 1.6 , 1.6);
            _timeBtn.transform = CGAffineTransformScale(_timeBtn.transform, 1.6 , 1.6);

        }completion:nil];
        clicked = NO;
    }
    else{
        [UIView animateWithDuration:1.0f delay:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
            _mainBtn.transform = CGAffineTransformRotate(_mainBtn.transform, 90* (M_PI / 180));
            _selfBtn.transform = CGAffineTransformRotate(_selfBtn.transform, 90* (M_PI / 180));
            _timeBtn.transform = CGAffineTransformRotate(_timeBtn.transform, 90* (M_PI / 180));
        }completion:nil];
        [UIView animateWithDuration:0.8f
                         animations:^{
                             _mainBtn.transform = CGAffineTransformIdentity;
                             _selfBtn.transform = CGAffineTransformIdentity;
                             _timeBtn.transform = CGAffineTransformIdentity;
                             CGPoint accountCenter = _mainBtn.center;
                             accountCenter.y += 80;
                             _mainBtn.center = accountCenter;
                             CGPoint accountCenter1 = _selfBtn.center;
                             accountCenter1.x -= 80;
                             _selfBtn.center = accountCenter1;
                             CGPoint accountCenter2 = _timeBtn.center;
                             accountCenter2.x -= 57;
                             accountCenter2.y += 57;
                             _timeBtn.center = accountCenter2;
                         }];
        
        clicked = YES;
    }


}
@end
