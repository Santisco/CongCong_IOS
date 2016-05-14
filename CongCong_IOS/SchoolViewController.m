//
//  SchoolViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/14.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "SchoolViewController.h"
#import "CampusTableViewCell.h"
#import "PopView.h"

@interface SchoolViewController (){
    NSArray *sourceArray;
    PopView *popview;
}

@end

@implementation SchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    sourceArray = [NSArray arrayWithObjects:@"大学",@"地区", nil];
    _campusTable.dataSource = self;
    _campusTable.delegate = self;
    _groundView.alpha =0;
    _groundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    popview = [[PopView alloc]initWithFrame:CGRectMake(65, 160, 240, 350)];
    popview.alpha=0;
    [self.view addSubview:popview];
    [popview.confirmBtn addTarget:self action:@selector(disappear) forControlEvents:UIControlEventTouchUpInside];
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
    
     CampusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"classCell0" forIndexPath:indexPath];
    cell.introLabel.text =[sourceArray objectAtIndex:indexPath.row];
    if (indexPath.row==0) {
        cell.showLabel.text = popview.showSchool;
    }
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [UIView animateWithDuration:0.5f
                     animations:^{
                         _groundView.alpha =1;
                         popview.alpha=1;
                         
                     }];
    
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

- (IBAction)backTrack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)touchDisaa:(id)sender {
    [UIView animateWithDuration:0.5f
                     animations:^{
                         _groundView.alpha =0;
                         popview.alpha =0;
                     }];
    
    [_campusTable reloadData];
    
}

- (void) disappear{
    [UIView animateWithDuration:0.5f
                     animations:^{
                         _groundView.alpha =0;
                         popview.alpha =0;
                     }];
    [_campusTable reloadData];
}

@end
