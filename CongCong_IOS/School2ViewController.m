//
//  School2ViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/14.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "School2ViewController.h"
#import "Campus2TableViewCell.h"

@interface School2ViewController (){
    NSArray *sourceArray;
}

@end

@implementation School2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    sourceArray = [NSArray arrayWithObjects:@"院系",@"班级",@"入学时间", nil];
    _showTable.delegate = self;
    _showTable.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    Campus2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"classCell0" forIndexPath:indexPath];
    cell.introLabel.text =[sourceArray objectAtIndex:indexPath.row];
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
