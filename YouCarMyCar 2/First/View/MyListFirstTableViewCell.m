//
//  MyListFirstTableViewCell.m
//  YouCarMyCar
//
//  Created by LLY on 15/7/2.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "MyListFirstTableViewCell.h"

@implementation MyListFirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self.cellheight = 170;
    self.cellweight = [UIScreen mainScreen].bounds.size.width;
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self costom];//布局;
        
    }
    return self;
    
}
-(void)costom
{
    

    
    
    //俩个底背景
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.cellweight, self.cellheight)];
    image1.image = [UIImage imageNamed:@"首页cell背景.png"];
    [self addSubview:image1];
    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 4, self.cellweight - 10, self.cellheight - 4)];
    image2.image = [UIImage imageNamed:@"白背景.png"];
    [self addSubview:image2];
    //商品
    self.myGoodImageVeiw  = [[UIImageView alloc]initWithFrame:CGRectMake(6, 6, (self.cellheight - 12 )/51 *44,self.cellheight - 12 )];
    self.myGoodImageVeiw.image = [UIImage imageNamed:@"1.jpg"];
    [self addSubview:self.myGoodImageVeiw];
    
    //描述的lable
    self.mydescritionLable = [[UILabel alloc]initWithFrame:CGRectMake(10+(self.cellheight - 12 )/51 *44, self.cellheight / 3, self.cellweight - (10+(self.cellheight - 12 )/51 *44) - 6 , self.cellheight / 3)];
    self.mydescritionLable.backgroundColor = [UIColor purpleColor];
    self.mydescritionLable.text = @"这是描述商品的";
    self.mydescritionLable.numberOfLines = 0;
    self.mydescritionLable.font = [UIFont fontWithName:nil size:self.cellheight / 3 / 3 - 3];
    [self addSubview:self.mydescritionLable];
    
    self.mybuttonImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10+(self.cellheight - 12 )/51 *44 + 5, self.cellheight / 4 * 3 + 10, self.cellweight - (self.cellweight / 2 - 20) - 20 , self.cellheight / 4 - 10)];
    self.mybuttonImageView.image = [UIImage imageNamed:@"3.png"];
    self.mybuttonImageView.userInteractionEnabled = YES;
    [self addSubview:self.mybuttonImageView];
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
