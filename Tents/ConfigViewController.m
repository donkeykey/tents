//
//  ConfigViewController.m
//  Tents
//
//  Created by 川島 大地 on 2014/07/26.
//  Copyright (c) 2014年 川島 大地. All rights reserved.
//

#import "ConfigViewController.h"

@interface ConfigViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor    = [UIColor whiteColor];
    self.navigationController.navigationBar.alpha        = 0.3f;
    self.navigationController.navigationBar.translucent  = YES;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * テーブル全体のセクションの数を返す
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/**
 * 指定されたセクションのセクション名を返す
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"";
}

/**
 * 指定されたセクションの項目数を返す
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSString *sectionName = [sectionList objectAtIndex:section];
//    return [self.cellLabel count];
    return 2;
}

/**
 * 指定された箇所のセルを作成する
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // セルが作成されていないか?
    if (!cell) { // yes
        // セルを作成
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // セルにテキストを設定
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"通常時";
            break;
        case 1:
            cell.textLabel.text = @"テント捜索時";
            break;
        default:
            break;
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
}

/**
 * セルが選択されたとき
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *controller;
    switch (indexPath.row) {
        case 0:
            controller = [[self storyboard] instantiateViewControllerWithIdentifier:@"UsualColorSelectionView"];
            break;
        case 1:
            controller = [[self storyboard] instantiateViewControllerWithIdentifier:@"EmergencyColorSelectionView"];
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:controller animated:YES];
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
