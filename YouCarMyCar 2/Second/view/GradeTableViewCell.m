//
//  GradeTableViewCell.m
//  YouCarMyCar
//
//  Created by ZhaoWei on 15/7/30.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "GradeTableViewCell.h"
#import "CommonHandle.h"
@implementation GradeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.isOne = YES;
    self.isTow = YES;
    self.isThree = YES;
    self.isFour = YES;
    self.isFive = YES;
}
- (IBAction)xingxing1:(id)sender {
    
    
    if (self.isOne == YES) {
        [self.xingxing1 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
        self.isOne = NO;
    }else if (self.isOne == NO) {
        [self.xingxing1 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
        self.isOne = YES;
    }
    
    [self.xingxing2 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing3 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing4 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing5 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
    
    
}
- (IBAction)xingxing2:(id)sender {
    
    if (self.isTow == YES) {
        [self.xingxing2 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
        self.isTow = NO;
    }else if (self.isTow == NO) {
        [self.xingxing2 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
        self.isTow = YES;
    }
    
    [self.xingxing1 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing3 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing4 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing5 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
}
- (IBAction)xingxing3:(id)sender {
    
    if (self.isThree == YES) {
        [self.xingxing3 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
        self.isThree = NO;
    }else if (self.isThree == NO) {
        [self.xingxing3 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
        self.isThree = YES;
    }
    
    [self.xingxing1 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing2 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing4 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing5 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
}
- (IBAction)xingxing4:(id)sender {
    
    if (self.isFour== YES) {
        [self.xingxing4 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
        self.isFour = NO;
    }else if (self.isFour == NO) {
        [self.xingxing4 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
        self.isFour = YES;
    }
    
    [self.xingxing1 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing2 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing3 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing5 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
}
- (IBAction)xingxing5:(id)sender {
    
    if (self.isFive== YES) {
        [self.xingxing5 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
        self.isFive = NO;
    }else if (self.isFive == NO) {
        [self.xingxing5 setImage:[UIImage imageNamed:@"星星未选中.png"] forState:(UIControlStateNormal)];
        self.isFive = YES;
    }
    
    [self.xingxing1 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing2 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing3 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
    [self.xingxing4 setImage:[UIImage imageNamed:@"星星选中.png"] forState:(UIControlStateNormal)];
}
- (IBAction)change:(id)sender {
    
    if ([CommonHandle shareHandle].isShiYongXieYi == YES) {
        [self.changeButton setImage:[UIImage imageNamed:@"未阅读.png"] forState:(UIControlStateNormal)];
        [CommonHandle shareHandle].isShiYongXieYi = NO;
    }else if ([CommonHandle shareHandle].isShiYongXieYi == NO){
        
        [self.changeButton setImage:[UIImage imageNamed:@"已阅读.png"] forState:(UIControlStateNormal)];
        [CommonHandle shareHandle].isShiYongXieYi = YES;
    }
    
}
- (IBAction)xieyi:(id)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
