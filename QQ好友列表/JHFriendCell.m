//
//  JHFriendCellTableViewCell.m
//  QQ好友列表
//
//  Created by piglikeyoung on 15/3/7.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHFriendCell.h"
#import "JHFriendModel.h"

@implementation JHFriendCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"friend";
    
    JHFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell==nil) {
        cell = [[JHFriendCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    return cell;
}

-(void)setFriendData:(JHFriendModel *)friendData
{
    _friendData = friendData;
    
    // 1.设置头像
    self.imageView.image = [UIImage imageNamed:_friendData.icon];
    
    // 2.设置昵称
    self.textLabel.text = _friendData.name;
    
    // 3.设置简介
    self.detailTextLabel.text = _friendData.intro;
    
    // 4.判断是否是会员
    if (_friendData.isVip) {
        [self.textLabel setTextColor:[UIColor redColor]];
    }else{
        [self.textLabel setTextColor:[UIColor blackColor]];
    }
}

@end
