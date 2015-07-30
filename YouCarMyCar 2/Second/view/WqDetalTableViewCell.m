//
//  WqDetalTableViewCell.m
//  YouCarMyCar
//
//  Created by LLY on 15/7/29.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "WqDetalTableViewCell.h"
#import "PrefixHeader.pch"

#import "HEInfiniteScrollView.h"

@implementation WqDetalTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self coustom];
        
    }
    return self;
    
}
-(void)coustom
{
    
    NSArray *images = @[ [UIImage imageNamed:@"Untitled2.jpg"],
                         [UIImage imageNamed:@"33.jpg"],
                         [UIImage imageNamed:@"45.jpg"],];
    HEInfiniteScrollView *infiniteScrollView = [[HEInfiniteScrollView alloc] initWithFrame:CGRectMake(0, 0, kMainWidth, 150)];
    [self addSubview:infiniteScrollView];
    [infiniteScrollView setContentObjs:images Placeholder:nil];
    infiniteScrollView.pageControlContentMode = kHEPageControlContentModeBottomCenter;
    infiniteScrollView.switchType = kHESwitchTypeFadeOut;

    self.myGoodsNameLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 150, kMainWidth, 20)];
    [self addSubview:self.myGoodsNameLable];
    
    UILabel *pingji = [[UILabel alloc]initWithFrame:CGRectMake(10, 180, 60, 20)];
    pingji.text = @"商品评分";
    pingji.font = [UIFont systemFontOfSize:12];
    [self addSubview:pingji];
    
    UILabel *old = [[UILabel alloc]initWithFrame:CGRectMake(10, 210, 70, 20)];
    old.text = @"适用年龄:";
    old.font = [UIFont systemFontOfSize:15];
    [self addSubview:old];
    
    self.mypeoOldLable = [[UILabel alloc]initWithFrame:CGRectMake(73 , 210, 118, 20)];
    self.mypeoOldLable.textColor = [UIColor redColor];
    [self addSubview:self.mypeoOldLable];
    
    
    self.mySureAddressButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.mySureAddressButton.frame = CGRectMake(200, 190, kMainWidth - 210, 40);
    [self.mySureAddressButton setBackgroundImage:[UIImage imageNamed:@"truck@2x.png"] forState:(UIControlStateNormal)];
    
    [self.mySureAddressButton addTarget:self action:@selector(mySureAddressButton:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self addSubview:self.mySureAddressButton];

    
    
    //===========可以不管 /// 是画的线
    UILabel *xian = [[UILabel alloc]initWithFrame:CGRectMake(0, 235, kMainWidth, 1)];
    [self addSubview:xian];
    xian.backgroundColor = [UIColor grayColor];
    xian.alpha = 0.4;
    UILabel *xian2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 275, kMainWidth, 1)];
    [self addSubview:xian2];
    xian2.backgroundColor = [UIColor grayColor];
    xian2.alpha = 0.4;
    UILabel *xian3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 315, kMainWidth, 1)];
    [self addSubview:xian3];
    xian3.backgroundColor = [UIColor grayColor];
    xian3.alpha = 0.3;
    //=========

    self.myreportNumberLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 275, kMainWidth, 40)];
    [self addSubview:self.myreportNumberLable];
    self.myreportNumberLable.textColor = [UIColor redColor];
    self.myreportNumberLable.textAlignment = NSTextAlignmentCenter;
    
    self.myReportButton = [UIButton  buttonWithType:(UIButtonTypeCustom)];
    self.myReportButton.frame = CGRectMake(15, 240, (kMainWidth - 45) / 2, 30);
    [self addSubview:self.myReportButton];
    [self.myReportButton addTarget:self action:@selector(myReportButton:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.myReportButton setBackgroundImage:[UIImage imageNamed:@"提交试用报告@2x.png"] forState:(UIControlStateNormal)];
    
    
    
    self.myLooklistButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.myLooklistButton.frame = CGRectMake((kMainWidth - 45) / 2 + 30, 240, (kMainWidth - 45) / 2, 30);
    [self.myLooklistButton setBackgroundImage:[UIImage imageNamed:@"查看中奖名单@2x.png"] forState:(UIControlStateNormal)];
    [self.myLooklistButton addTarget:self action:@selector(myLooklistButton:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self addSubview:self.myLooklistButton];
    
    
}
-(void)mySureAddressButton:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(sureAddress:)]) {
        [self.delegate sureAddress:button];
        
    }
}
-(void)myReportButton:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(liftButton:)]) {
        [self.delegate liftButton:button];
        
    }
}
-(void)myLooklistButton:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(rigthButton:)]) {
        [self.delegate rigthButton:button];
        
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
