//
//  SchoolViewController.h
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/14.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CampusTableViewCell.h"
@interface SchoolViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *campusTable;

- (IBAction)backTrack:(id)sender;

@end
