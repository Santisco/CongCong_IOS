//
//  SchoolViewController.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/14.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "SchoolViewController.h"
#import "CampusTableViewCell.h"

@interface SchoolViewController (){
    NSArray *sourceArray;
}

@end

@implementation SchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    sourceArray = [NSArray arrayWithObjects:@"大学",@"地区", nil];
    _campusTable.dataSource = self;
    _campusTable.delegate = self;
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
    return cell;

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
@end
