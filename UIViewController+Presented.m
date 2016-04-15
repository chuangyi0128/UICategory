//
//  UIViewController+Presented.m
//  NeteaseLottery
//
//  Created by SongLi on 02/04/2015.
//  Copyright (c) 2014年 netease. All rights reserved.
//

#import "UIViewController+Presented.h"

@implementation UIViewController (Presented)

- (BOOL)SLR_isBePresented
{
    BOOL isNavigationRoot = ([self.navigationController.viewControllers firstObject] == self);
    UIViewController *controller = self;
    if (isNavigationRoot) {
        controller = self.navigationController;
    }
    
    return (!controller.parentViewController && controller.presentingViewController);
}

@end
