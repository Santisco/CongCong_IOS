//
//  PopView.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/14.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "PopView.h"


@implementation PopView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    sourceArray =[NSArray arrayWithObjects:@"东北大学",@"湖南大学",@"蓝翔职工学校",@"北京大学",@"东南大学",@"西南大学",@"西北大学", nil];
    _showSchool = @"编辑";
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.13 green:0.57 blue:0.64 alpha:1];
        self.layer.cornerRadius=4;
    }
    _topField = [[UITextField alloc] initWithFrame:CGRectMake(15, 15, 210, 30)];
    _topField.layer.cornerRadius=2;
    _topField.placeholder = @"请输入位置";
    _topField.backgroundColor = [UIColor whiteColor];
    [self addSubview:_topField];
    _campusView = [[UITableView alloc]initWithFrame:CGRectMake(15, 53, 210, 249)];
    _campusView.delegate =self;
    _campusView.dataSource =self;
    [self addSubview:_campusView];
    _confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(98, 312, 45, 30)];
    [_confirmBtn setTitle:@"完成" forState:UIControlStateNormal];
    [_confirmBtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [self addSubview:_confirmBtn];
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [sourceArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = [sourceArray objectAtIndex:indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _topField.text = [sourceArray objectAtIndex:indexPath.row];
    _showSchool = [sourceArray objectAtIndex:indexPath.row];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
