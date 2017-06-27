//
//  GKJSuccessAnimation.h
//  GKJLoadingAnimationDemo
//
//  Created by Kangjia on 2017/1/10.
//  Copyright © 2017年 idol_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKJSuccessAnimation : UIView<CAAnimationDelegate>

-(void)start;

-(void)hide;

+(GKJSuccessAnimation*)showIn:(UIView*)view;

+(GKJSuccessAnimation*)hideIn:(UIView*)view;

@end
