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
    if (self.parentViewController == self.navigationController && self.navigationController.parentViewController == nil && self.presentingViewController) {
        return YES;
    } else {
        return NO;
    }
}

@end
