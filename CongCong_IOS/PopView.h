//
//  PopView.h
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/14.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopView : UIView<UITableViewDelegate,UITableViewDataSource>{
    NSArray *sourceArray;
}

@property (nonatomic ,strong) UITextField *topField;
@property (nonatomic, strong) UITableView *campusView;
@property (nonatomic, strong) UIButton *confirmBtn;
@property NSString *showSchool;
@end
