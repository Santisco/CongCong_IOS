//
//  DialogViewController.h
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/17.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DialogViewController : UIViewController<UITableViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *groundTablr;
- (IBAction)tapEdit:(id)sender;
- (IBAction)backTrack:(id)sender;

@end
