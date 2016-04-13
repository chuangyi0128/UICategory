//
//  UIImage+Tint.m
//
//  Created by Matt Gemmell on 04/07/2010.
//  Copyright 2010 Instinctive Code.
//

#import "UIImage+Tint.h"


@implementation UIImage (MGTint)


- (UIImage *)imageTintedWithColor:(UIColor *)color
{
    return [self imageTintedWithColor:color fraction:0.0];
}


- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction
{
    if (color) {
        UIImage *image;
        
        if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
            UIGraphicsBeginImageContextWithOptions([self size], NO, 0.f);
        } else {
            UIGraphicsBeginImageContext([self size]);
        }
        CGRect rect = CGRectZero;
        rect.size = [self size];

        [color set];
        UIRectFill(rect);

        [self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0];

        if (fraction > 0.0) {
            [self drawInRect:rect blendMode:kCGBlendModeSourceAtop alpha:fraction];
        }
        
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        return image;
    }

    return self;
}


@end
