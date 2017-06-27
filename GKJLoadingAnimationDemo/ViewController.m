//
//  ViewController.m
//  GKJLoadingAnimationDemo
//
//  Created by Kangjia on 2017/1/10.
//  Copyright © 2017年 idol_iOS. All rights reserved.
//

#import "ViewController.h"
#import "GKJLoadingAnimation.h"
#import "GKJSuccessAnimation.h"

@interface ViewController ()

@property (nonatomic ,strong) UIButton *rightBarButton;
@property (assign) BOOL animateVisible;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self commontInitUI];
}

- (void)commontInitUI{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self myCustomRightBarView]];
}

- (UIButton *)myCustomRightBarView{
    
    _rightBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBarButton.frame = CGRectMake(120, 0, 32, 30);
    [_rightBarButton addTarget:self action:@selector(rightBarButtonDidPress:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((_rightBarButton.frame.size.width-20)/2, 5, 20, 20)];
    [imageView setImage:[UIImage imageNamed:@"ic_new_idol_switch"]];
    [_rightBarButton addSubview:imageView];
    return _rightBarButton;
}

-(void)rightBarButtonDidPress:(id)sender{

    if (!_animateVisible) {
        
        _animateVisible = YES;
        
        [UIView animateWithDuration:0.3 animations:^{
            for (UIView *view in self.rightBarButton.subviews) {
                if ([view isKindOfClass:[UIImageView class]]) {
                    view.transform = CGAffineTransformMakeRotation((45.0f * M_PI) / 180.0f);
                }
            }
        } completion:^(BOOL finished) {
            
            self.title = @"Loading";
            
            //隐藏完成动画
            [GKJSuccessAnimation hideIn:self.view];
            //显示loading动画
            [GKJLoadingAnimation showIn:self.view];

        }];
    }
    else
    {
        _animateVisible = NO;
        
        [UIView animateWithDuration:0.3 animations:^{
            
            for (UIView *view in self.rightBarButton.subviews) {
                if ([view isKindOfClass:[UIImageView class]]) {
                    view.transform = CGAffineTransformIdentity;
                }
            }
        } completion:^(BOOL finished) {
            
            self.title = @"Success";
            
            //隐藏loading动画
            [GKJLoadingAnimation hideIn:self.view];
            //显示完成动画
            [GKJSuccessAnimation showIn:self.view];
            
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
