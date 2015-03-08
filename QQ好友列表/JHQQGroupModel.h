//
//  JHQQGroupModel.h
//  QQ好友列表
//
//  Created by piglikeyoung on 15/3/7.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHGlobal.h"

@interface JHQQGroupModel : NSObject

// 存放当前组所有的好友信息(好友模型)
@property (strong , nonatomic) NSArray *friends;

// 分组名称
@property (copy , nonatomic) NSString *name;

// 在线人数
@property (copy , nonatomic) NSString *online;

JHInitH(qqGroup)

@end
