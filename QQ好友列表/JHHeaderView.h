//
//  JHHeaderView.h
//  QQ好友列表
//
//  Created by piglikeyoung on 15/3/8.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHQQGroupModel;

@interface JHHeaderView : UITableViewHeaderFooterView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

// 分组模型
@property (strong , nonatomic) JHQQGroupModel *qqGroup;

@end
