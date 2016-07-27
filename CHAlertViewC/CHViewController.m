//
//  CHViewController.m
//  CHAlertViewC
//
//  Created by 郭金涛 on 16/7/20.
//  Copyright © 2016年 速道科技. All rights reserved.
//

#import "CHViewController.h"
#import "NSObject+CHAlert.h"

@interface CHViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)NSArray *array;
@end

@implementation CHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提示框";
    
    self.tableview = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:(UITableViewStylePlain)];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
     self.array = [NSArray arrayWithObjects:@"只有确定按钮,系统样式",@"只有确定按钮,自定义样式",@"只有确定按钮 有确定回调 系统样式",@"只有确定按钮 有确定回调 自定义样式",@"只有一个按钮 可以改变按钮文字 有回调方法 系统样式",@"只有一个按钮 可以改变按钮文字 有回调方法 自定义样式",@"有俩个按钮确定与取消 并且确定按钮有回调方法 系统样式",@"有俩个按钮确定与取消 并且确定按钮有回调方法 自定义样式",@"有俩个按钮确定与取消 确定与取消按钮都有回调方法 系统样式",@"有俩个按钮确定与取消 确定与取消按钮都有回调方法 自定义样式",@"有俩个按钮 可以改变按钮文字 俩个按钮都有回调方法 自定义样式",nil];
    // Do any additional setup after loading the view.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.numberOfLines = 0;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self ch_alertConfimTitle:@"提示" message:[self.array objectAtIndex:indexPath.row]];
    }
    if (indexPath.row == 1) {
        [self ch_alertConfimTitle:@"提示" message:[self.array objectAtIndex:indexPath.row] style:CHAlertCustomStyle];
    }
    if (indexPath.row == 2) {
        [self ch_alertConfimTitle:@"提示" message:[self.array objectAtIndex:indexPath.row] confimBlock:^{
            NSLog(@"你点击了确定");
        }];
    }
    if (indexPath.row == 3) {
        [self ch_alertConfimTitle:@"提示" message:[self.array objectAtIndex:indexPath.row] confimBlock:^{
            NSLog(@"你点击了确定");
        } style:CHAlertCustomStyle];
    }
    if (indexPath.row == 4) {
        [self ch_alertConfimTitle:@"提示" message:[self.array objectAtIndex:indexPath.row] confimTitle:@"确定" confimBlock:^{
            NSLog(@"你点击了确定");
        }];
    }
    if (indexPath.row == 5) {
        [self ch_alertConfimTitle:@"提示" message:[self.array objectAtIndex:indexPath.row] confimTitle:@"确定" confimBlock:^{
            NSLog(@"你点击了确定");
        } style:CHAlertCustomStyle];
    }
    if (indexPath.row == 6) {
        [self ch_alertDialogTitle:@"提示" message:[self.array objectAtIndex:indexPath.row] confimBlock:^{
            NSLog(@"你点击了确定");
        }];
    }
    if (indexPath.row == 7) {
        [self ch_alertDialogTitle:@"提示" message:[self.array objectAtIndex:indexPath.row] confimBlock:^{
            NSLog(@"你点击了确定");
        } style:CHAlertCustomStyle];
    }
    if (indexPath.row == 8) {
        [self ch_alertDialogTitle:@"提示" message:[self.array objectAtIndex:indexPath.row] cancelBlock:^{
            NSLog(@"你点击了取消");
        } confimBlock:^{
            NSLog(@"你点击了确定");
        }];
    }
    if (indexPath.row == 9) {
        [self ch_alertDialogTitle:@"提示" message:[self.array objectAtIndex:indexPath.row] cancelBlock:^{
            NSLog(@"你点击了取消");
        } confimBlock:^{
            NSLog(@"你点击了确定");
        } style:CHAlertCustomStyle];
    }
    if (indexPath.row == 10) {
        [self ch_alertDialogTitle:@"提示" message:[self.array objectAtIndex:indexPath.row] confimBlock:^{
            NSLog(@"你点击了确定");
        } cancelBlock:^{
            NSLog(@"你点击了取消");
        } cancelButtonTitle:@"取消" confimButtonTitle:@"确定" style:(CHAlertCustomStyle)];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
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

@end
