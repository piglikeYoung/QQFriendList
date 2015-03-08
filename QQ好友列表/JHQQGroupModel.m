//
//  JHQQGroupModel.m
//  QQ好友列表
//
//  Created by piglikeyoung on 15/3/7.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHQQGroupModel.h"
#import "JHFriendModel.h"

@implementation JHQQGroupModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 1.将字典转换成模型
        [self setValuesForKeysWithDictionary:dict];
        // 定义数组保存转换后的模型
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:self.friends.count];
        // 2.特殊处理friends中的数据
        for (NSDictionary *dict in self.friends) {
            // 2.1转换为模型
            JHFriendModel *friend = [JHFriendModel friendWithDict:dict];
            [models addObject:friend];
        }
        self.friends = models;
    }
    
    return self;
}

+(instancetype)qqGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
