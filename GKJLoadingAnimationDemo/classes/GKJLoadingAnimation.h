//
//  GKJLoadingAnimation.h
//  GKJLoadingAnimationDemo
//
//  Created by Kangjia on 2017/1/10.
//  Copyright © 2017年 idol_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKJLoadingAnimation : UIView<CAAnimationDelegate>

-(void)start;

-(void)hide;

+(GKJLoadingAnimation*)showIn:(UIView*)view;

+(GKJLoadingAnimation*)hideIn:(UIView*)view;

@end
