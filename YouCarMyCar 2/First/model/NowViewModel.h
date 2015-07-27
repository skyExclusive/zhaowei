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
 "goods_id": "100722",
 "goods_image": "http://img.nichewoche.com/shop/store/goods/2/2_04714398542545832_240.jpg",
 "goods_name": "瑞驰通用雨刷 R-018  单只装雨刷 刮刮乐瑞驰 正品保障更静音 其它 26寸 通用",
 "goods_promotion_price": "25.00"
 */

@property (nonatomic ,strong)NSString *goods_id;
@property (nonatomic ,strong)NSString  *goods_image;
@property (nonatomic ,strong)NSString *goods_name;
@property(nonatomic ,strong)NSString *goods_promotion_price;


@end
