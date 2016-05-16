//
//  ContactViewController.h
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/16.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *contactTable;
- (IBAction)backTrack:(id)sender;

@end
