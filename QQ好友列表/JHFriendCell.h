//
//  JHFriendCellTableViewCell.h
//  QQ好友列表
//
//  Created by piglikeyoung on 15/3/7.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHFriendModel;

@interface JHFriendCell : UITableViewCell

@property (strong , nonatomic) JHFriendModel *friendData;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
