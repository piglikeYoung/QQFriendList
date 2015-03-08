//
//  JHFriendModel.h
//  QQ好友列表
//
//  Created by piglikeyoung on 15/3/7.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHGlobal.h"

@interface JHFriendModel : NSObject

// 头像
@property (copy , nonatomic) NSString *icon;

// 简介
@property (copy , nonatomic) NSString *intro;

// 呢称
@property (copy , nonatomic) NSString *name;

// 是否vip
@property (nonatomic, assign, getter=isVip) BOOL vip;

JHInitH(friend);

@end
