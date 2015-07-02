//
//  ButtonTableViewCell.m
//  youCarmyCar
//
//  Created by ZhaoWei on 15/6/25.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "ButtonTableViewCell.h"

@implementation ButtonTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)payButton:(id)sender {
    NSLog(@"aaaaaa");
}
- (IBAction)sendButton:(id)sender {
     NSLog(@"aaaaaa");
}
- (IBAction)receiveButton:(id)sender {
     NSLog(@"aaaaaa");
}
- (IBAction)evaluateButton:(id)sender {
     NSLog(@"aaaaaa");
}
- (IBAction)returnButton:(id)sender {
     NSLog(@"aaaaaa");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
