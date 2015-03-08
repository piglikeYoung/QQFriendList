//
//  ViewController.m
//  QQ好友列表
//
//  Created by piglikeyoung on 15/3/7.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "ViewController.h"
#import "JHFriendModel.h"
#import "JHQQGroupModel.h"
#import "JHFriendCell.h"
#import "JHHeaderView.h"

@interface ViewController ()

// 保存所有的分组数据
@property (strong , nonatomic) NSArray *qqGroups;

@end

@implementation ViewController


#pragma mark - 懒加载
- (NSArray *)qqGroups
{
    if (_qqGroups == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            JHQQGroupModel *qqGroip = [JHQQGroupModel qqGroupWithDict:dict];
            [models addObject:qqGroip];
        }
        self.qqGroups = [models copy];
    }
    return _qqGroups;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - 数据源方法
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.qqGroups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 1.取出对应的组模型
    JHQQGroupModel *qqGroup = self.qqGroups[section];
    // 2.返回对应的组中的好友数
    return qqGroup.friends.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    JHFriendCell *cell = [JHFriendCell cellWithTableView:tableView];
    // 2.传递数据
    // 2.1取出对应的组模型
    JHQQGroupModel *qqGroup = self.qqGroups[indexPath.section];
    JHFriendModel *friend = qqGroup.friends[indexPath.row];
    cell.friendData = friend;
    
    // 3.返回cell
    return cell;
}

#pragma mark - 代理方法
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 1.创建头部视图
    JHHeaderView *headerView = [JHHeaderView headerViewWithTableView:tableView];
    // 2.返回头部视图
    headerView.qqGroup = self.qqGroups[section];
    
    return headerView;
}

/** 设置分组头部标题的高度 */
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
