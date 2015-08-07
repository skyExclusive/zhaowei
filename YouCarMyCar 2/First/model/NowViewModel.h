//
//  NowViewModel.h
//  YouCarMyCar
//
//  Created by LLY on 15/7/27.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NowViewModel : NSObject

/*

 "": "1438741549",
 "": "测试8-5",
 "": "0",
 "": "100",
 "": "1"
 "": -6,
 "": "100",
 ": "60",
 ": "600.00",
 "": "5",
 "": -40,
 ""
 ": "04920856293597216.jpg",
 "": -1,
 "": -6,
 "": "26",
 "": "04920856234257237.jpg",
 ""

 */

@property (nonatomic ,strong)NSString *start_time;
@property (nonatomic ,strong)NSString *title;
@property (nonatomic ,strong)NSString *try_limit_people;
@property (nonatomic ,strong)NSString *try_people;
@property (nonatomic ,strong)NSString *type;
@property (nonatomic ,strong)NSString *minutes;
@property (nonatomic ,strong)NSString *number;
@property (nonatomic ,strong)NSString *period_no;
@property (nonatomic ,strong)NSString *priceseconds;
@property (nonatomic ,strong)NSString *score;
@property (nonatomic ,strong)NSString *small_info;
@property (nonatomic ,strong)NSString *big_img;
@property (nonatomic ,strong)NSString *date;
@property (nonatomic ,strong)NSString *hours;
@property (nonatomic ,strong)NSString *myid;
@property (nonatomic ,strong)NSString *img;
@property (nonatomic ,strong)NSString *info;


@end
