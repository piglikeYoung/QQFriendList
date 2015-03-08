//
//  JHHeaderView.m
//  QQ好友列表
//
//  Created by piglikeyoung on 15/3/8.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHHeaderView.h"
#import "JHQQGroupModel.h"

@interface JHHeaderView()

@property (weak , nonatomic) UIButton *btn;

@property (weak , nonatomic) UILabel *label;

@end

@implementation JHHeaderView

// 创建头部信息
+(instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"header";
    JHHeaderView *headderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    
    if (headderView == nil) {
        headderView = [[JHHeaderView alloc] initWithReuseIdentifier:identifier];
    }
    
    return headderView;
}

// 但凡在init方法中获取到的frame都是0
-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 添加子控件
        // 1.1添加按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        // 设置按钮的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        
        // 设置按钮上的尖尖图片
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        // 1.设置按钮的内容左对齐
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 2.设置按钮的内边距，按钮的内容距离左边有一定的距离
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        // 3.设置按钮的标题和图片之间的距离
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        
        // 设置按钮标题颜色
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:btn];
        self.btn = btn;
        
        // 1.2添加label
        UILabel *label = [[UILabel alloc]init];
        //设置文本右对齐
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor grayColor];
        [self addSubview:label];
        self.label = label;
    }
    
    return self;
}

// 该方法在控件的frame被改变的时候就会调用
// 该方法一般用于调整子控件的位置
-(void)layoutSubviews
{
    #warning 切记重写layoutSubviews方法一定要调用父类的layoutSubviews
    [super layoutSubviews];
    // 1.设置按钮的frame
    self.btn.frame = self.bounds;
    // 2.设置label的fram
    CGFloat padding = 20;// 间隙
    CGFloat labelY = 0;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelW = 150;
    CGFloat labelX = self.bounds.size.width - padding - labelW;
    self.label.frame = CGRectMake(labelX, labelY, labelW, labelH);
}

-(void)btnOnClick:(UIButton *)btn
{
    NSLog(@"click");
}

-(void)setQqGroup:(JHQQGroupModel *)qqGroup
{
    _qqGroup = qqGroup;
    
    // 1.设置按钮上的文字
    [self.btn setTitle:_qqGroup.name forState:UIControlStateNormal];
    // 2.设置在线人数
    self.label.text = [NSString stringWithFormat:@"%@/%d",  _qqGroup.online, _qqGroup.friends.count];
}

@end
