//
//  ContactViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/16.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactTableViewCell.h"

@interface ContactViewController (){
    NSMutableArray *info;
    NSMutableArray *header;
}

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    info  = [NSMutableArray arrayWithArray:@[
                                             @[@"a",@"aa",@"aaa"],
                                             @[@"b",@"bb",@"bbb"],
                                             @[@"c",@"cc",@"ccc"],
                                             @[@"d",@"dd",@"ddd"],
                                             @[@"e",@"ee",@"eee"]
                                             ]];
    header = [NSMutableArray arrayWithObjects:@"A",@"B", @"C",@"D",@"E" ,nil];
    _contactTable.dataSource = self;
    _contactTable.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return header[section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [info count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [info[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"classCell0" forIndexPath:indexPath];
    cell.titleLabel.text = info[indexPath.section][indexPath.row];
    return cell;
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
