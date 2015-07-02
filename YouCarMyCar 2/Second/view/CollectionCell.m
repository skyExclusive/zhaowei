//
//  CollectionCell.m
//  YouCarMyCar
//
//  Created by ZhaoWei on 15/7/1.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "CollectionCell.h"
#import "PrefixHeader.pch"
@implementation CollectionCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAllViews];
        
    }
    return self;
}
//用来添加子视图
-(void)addAllViews
{
    UIView *view = [[UIView alloc]initWithFrame:self.bounds];
    [self addSubview:view];
    view.layer.cornerRadius = 15;
    view.layer.masksToBounds = 15;
    
    [view addSubview:self.myimageView];
    [view addSubview:self.mylabel];
    self.mylabel.textAlignment = NSTextAlignmentCenter;
    self.mylabel.textColor = [UIColor whiteColor];
   
}
-(UILabel *)mylabel
{
    if (!_mylabel) {
        _mylabel = [[UILabel alloc]init];
    }
    
    return _mylabel;
}
-(UIImageView *)myimageView
{
    if (!_myimageView) {
        _myimageView = [[UIImageView alloc]init];
    }
    return _myimageView;
}

-(void)layoutSubviews
{
    
    //调用父类的方法
    [super layoutSubviews];
    [self.mylabel setFrame:CGRectMake(10, 140, 150,20 )];
    [self.myimageView setFrame:CGRectMake(10, 10, 150, 150)];
}
@end
