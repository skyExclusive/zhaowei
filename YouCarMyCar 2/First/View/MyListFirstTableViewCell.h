//
//  MyListFirstTableViewCell.h
//  YouCarMyCar
//
//  Created by LLY on 15/7/2.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol mylistFirstbleDelegate <NSObject>

@end


@interface MyListFirstTableViewCell : UITableViewCell

@property (nonatomic ,strong)UIImageView *myGoodImageVeiw;
@property (nonatomic ,strong)UILabel *mydescritionLable;
@property (nonatomic)CGFloat cellheight;
@property (nonatomic )CGFloat cellweight;
@property (nonatomic,strong)UIImageView *mybuttonImageView;




@end
