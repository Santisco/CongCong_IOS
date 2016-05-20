//
//  DialogTableViewCell.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/17.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "DialogTableViewCell.h"

@implementation DialogTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    CGRect temp = self.dialogContent.frame;
    temp.size = CGSizeMake(140, 1000);
    self.dialogContent.frame = temp;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
