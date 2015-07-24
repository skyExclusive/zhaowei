//
//  NowDetaNeiViewController.m
//  YouCarMyCar
//
//  Created by LLY on 15/7/24.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "NowDetaNeiViewController.h"
#import "HEInfiniteScrollView.h"


@interface NowDetaNeiViewController ()

@end

@implementation NowDetaNeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *images = @[ [UIImage imageNamed:@"45.jpg"],
                         [UIImage imageNamed:@"Untitled2.jpg"],
                         [UIImage imageNamed:@"33.jpg"]];
    
    
    
    HEInfiniteScrollView *infiniteScrollView = [[HEInfiniteScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200)];
    [self.view addSubview:infiniteScrollView];
    [infiniteScrollView setContentObjs:images Placeholder:nil];
    infiniteScrollView.pageControlContentMode = kHEPageControlContentModeBottomCenter;
    infiniteScrollView.switchType = kHESwitchTypeFadeOut;
    //        infiniteScrollView.delegate = self;
    

    
    
    // Do any additional setup after loading the view.
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
