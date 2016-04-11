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
    UIViewController *rootViewContoller = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [UIViewController topViewController:rootViewContoller];
}

+ (UIViewController *)topViewControllerInController:(UIViewController *)viewController
{
    if ([viewController presentedViewController]) {
        UIViewController *topViewController = [viewController presentedViewController];
        return [self topViewControllerInController:topViewController];
    }
    else if ([viewController isKindOfClass:[UITabBarController class]]) {
        UIViewController *topViewController = [(UITabBarController *)viewController selectedViewController];
        return [self topViewControllerInController:topViewController];
    }
    else if ([viewController isKindOfClass:[UINavigationController class]]) {
        UIViewController *topViewController = [(UINavigationController *)viewController topViewController];
        return [self topViewControllerInController:topViewController];
    }
    else {
        return viewController;
    }
}

@end
