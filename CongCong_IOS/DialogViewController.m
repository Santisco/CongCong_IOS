//
//  DialogViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/17.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "DialogViewController.h"
#import "DialogTableViewCell.h"
#import "DialogTableViewCell2.h"
@interface DialogViewController (){
    NSMutableArray *listArray;
    CGFloat height;
}

@end

@implementation DialogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"哈啊哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",@"content",@"rect",@"image",@"in",@"state", nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈",@"content",@"rect",@"image",@"out",@"state", nil];
    listArray = [NSMutableArray arrayWithObjects:dic1,dic2, nil];
    _groundTablr.delegate = self;
    _groundTablr.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = listArray[indexPath.row];
    
    if ([[dict objectForKey:@"state"] isEqualToString:@"in"]) {
        DialogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"classCell0" forIndexPath:indexPath];
        CGRect temp = cell.dialogContent.frame;
        temp.size = CGSizeMake(140, 1000);
        cell.dialogContent.frame = temp;
        cell.dialogContent.lineBreakMode = NSLineBreakByWordWrapping;
        cell.dialogContent.numberOfLines = 0;
        cell.dialogContent.text = [dict objectForKey:@"content"];

        height = 100;
        return cell;
          }
    else {
        DialogTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"classCell1" forIndexPath:indexPath];
        cell.dialogContent.text = [dict objectForKey:@"content"];
        return cell;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [self.groundTablr endEditing:YES];
}

- (IBAction)tapEdit:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)backTrack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
