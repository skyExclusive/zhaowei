//
//  LoginViewController.h
//  YouCarMyCar
//
//  Created by LLY on 15/7/4.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (nonatomic ,strong)UIImageView *qqImageView;
@property (nonatomic ,strong)UIImageView *weixinImageView;
@property (nonatomic ,strong)UIImageView *xinlangImageView;

@property (nonatomic ,strong)UIImageView *photoImabeView;
@property (nonatomic,strong)UILabel *userNameLable;
@property (nonatomic,strong)UILabel *userPassWordLable;
@property (nonatomic ,strong)UITextField *userNameTextField;
@property (nonatomic ,strong)UITextField *userPassWordTextField;
@property (nonatomic,strong)UIImageView *userNameImageView;
@property (nonatomic ,strong)UIImageView *userPassWordImageView;
@property (nonatomic )CGFloat indextX;
@property (nonatomic)CGFloat indextY;
@property (nonatomic ,strong)UIButton  *forgetPasswordButton;
@property (nonatomic,strong)UIButton *registerButton;
@property (nonatomic ,strong)UIButton *loginButton;


@end
