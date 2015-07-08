//
//  LoginViewController.m
//  YouCarMyCar
//
//  Created by LLY on 15/7/4.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "LoginViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <QZoneConnection/ISSQZoneApp.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录界面";
    
    
    [self coustom];//布局
    
    
    
    // Do any additional setup after loading the view.
}
-(void)coustom
{
    
    //返回的箭头
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:@"向左白色箭头.png"] forState:(UIControlStateNormal)];
    button.frame =CGRectMake(0, 0, 15, 25);
    [button addTarget:self action:@selector(pop) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *lift = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = lift;
   // 第三方登录
    self.otherLoginLable  = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, self.view.frame.size.width - 40, 30)];
    self.otherLoginLable.text = @"其他登录";
    self.otherLoginLable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.otherLoginLable];
    
    self.qqImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 250, (self.view.frame.size.width - 40 ) / 3 - 20, (self.view.frame.size.width - 40 ) / 3 - 20)];
    self.qqImageView.image = [UIImage imageNamed:@"sns_icon_24.png"];
    [self.view addSubview:self.qqImageView];
    self.qqImageView.tag = 101;
    self.qqImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(login:)];
    [self.qqImageView addGestureRecognizer:tap];
    
    
    self.weixinImageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 40 ) / 3 - 20 + 50, 250, (self.view.frame.size.width - 40 ) / 3 - 20, (self.view.frame.size.width - 40 ) / 3 - 20)];
    self.weixinImageView.tag = 102;
    self.weixinImageView.userInteractionEnabled = YES;
    
    
    self.weixinImageView.image = [UIImage imageNamed:@"weixin.png"];
    UITapGestureRecognizer *tapweixin = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(login:)];
    [self.weixinImageView addGestureRecognizer:tapweixin];
    
    [self.view addSubview:self.weixinImageView];
    self.xinlangImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 30 - (self.view.frame.size.width - 40 ) / 3 + 20 , 250, (self.view.frame.size.width - 40 ) / 3 - 20, (self.view.frame.size.width - 40 ) / 3 - 20)];
    self.xinlangImageView.image = [UIImage imageNamed:@"sdk_weibo_logo.png"];
    UITapGestureRecognizer *tapxinlang = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(login:)];
    [self.xinlangImageView addGestureRecognizer:tapxinlang];
    self.xinlangImageView.tag = 103;
    self.xinlangImageView.userInteractionEnabled = YES;
    
    
    
    [self.view addSubview:self.xinlangImageView];
    
    
}

-(void)login:(UITapGestureRecognizer *)sent
{
    UIImageView *image = (UIImageView *)sent.view;
        if (image.tag == 101) {
        NSLog(@"QQ登录");
        [ShareSDK getUserInfoWithType:ShareTypeQQSpace authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
            if (result) {
                NSLog(@"授权登陆成功，已获取用户信息");
                NSString *uid = [userInfo uid];
                NSString *nickname = [userInfo nickname];
                NSString *profileImage = [userInfo profileImage];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:[NSString stringWithFormat:@"授权登陆成功,用户ID:%@,昵称:%@,头像:%@",uid,nickname,profileImage] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                NSLog(@"source:%@",[userInfo sourceData]);
                NSLog(@"uid:%@",[userInfo uid]);
                
                
            }else{
                NSLog(@"分享失败,错误码:%ld,错误描述%@",(long)[error errorCode],[error errorDescription]);
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:@"授权失败，请看日记错误描述" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }];

        
    }else if (image.tag == 102){
        
        NSLog(@"微信登录");
        [ShareSDK getUserInfoWithType:ShareTypeWeixiSession authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
            if (result) {
                NSLog(@"授权登陆成功，已获取用户信息");
                NSString *uid = [userInfo uid];
                NSString *nickname = [userInfo nickname];
                NSString *profileImage = [userInfo profileImage];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:[NSString stringWithFormat:@"授权登陆成功,用户ID:%@,昵称:%@,头像:%@",uid,nickname,profileImage] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                NSLog(@"source:%@",[userInfo sourceData]);
                NSLog(@"uid:%@",[userInfo uid]);
                
                
            }else{
                NSLog(@"分享失败,错误码:%ld,错误描述%@",(long)[error errorCode],[error errorDescription]);
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:@"授权失败，请看日记错误描述" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }];

        
    }else if (image.tag == 103){
        
        NSLog(@"微博登录");
        id<ISSQZoneApp> app =(id<ISSQZoneApp>)[ShareSDK getClientWithType:ShareTypeQQSpace];
        [app setIsAllowWebAuthorize:YES];
        
        
        [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
            if (result) {
                NSLog(@"授权登陆成功，已获取用户信息");
                NSString *uid = [userInfo uid];
                NSString *nickname = [userInfo nickname];
                NSString *profileImage = [userInfo profileImage];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:[NSString stringWithFormat:@"授权登陆成功,用户ID:%@,昵称:%@,头像:%@",uid,nickname,profileImage] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                NSLog(@"source:%@",[userInfo sourceData]);
                NSLog(@"uid:%@",[userInfo uid]);
                
                
            }else{
                NSLog(@"分享失败,错误码:%ld,错误描述%@",(long)[error errorCode],[error errorDescription]);
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:@"授权失败，请看日记错误描述" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }];

        
    }
    
    
}
-(void)pop
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
