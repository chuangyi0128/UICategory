//
//  UIViewController+TopmostViewController.m
//  NeteaseLottery
//
//  Created by SongLi on 02/04/2015.
//  Copyright (c) 2014年 netease. All rights reserved.
//

#import "UIViewController+TopmostViewController.h"

@implementation UIViewController (TopmostViewController)

+ (UIViewController *)topmostViewController
{
    //rootViewController需要是TabBarController,排除正在显示FirstPage的情况
    UIViewController *rootViewContoller = [UIApplication sharedApplication].delegate.window.rootViewController;
    if (!rootViewContoller || ![rootViewContoller isKindOfClass:[UITabBarController class]]) {
        return nil;
    }
    
    //当前显示哪个tab页
    UINavigationController *rootNavController = (UINavigationController *) [(UITabBarController*)rootViewContoller selectedViewController];
    if (!rootNavController) {
        return nil;
    }
    
    UINavigationController *navController = rootNavController;
    while ([navController isKindOfClass:[UINavigationController class]]) {
        UIViewController *topViewController = [navController topViewController];
        if ([topViewController isKindOfClass:[UINavigationController class]]) { //顶层是个导航控制器，继续循环
            navController = (UINavigationController *) topViewController;
        } else {
            //是否有弹出presentViewControllr;
            UIViewController *presentedViewController = topViewController.presentedViewController;
            while (presentedViewController) {
                topViewController = presentedViewController;
                if ([topViewController isKindOfClass:[UINavigationController class]]) {
                    break;
                } else {
                    presentedViewController = topViewController.presentedViewController;
                }
            }
            navController = (UINavigationController *) topViewController;
        }
    }
    return (UIViewController *) navController;
}


@end
