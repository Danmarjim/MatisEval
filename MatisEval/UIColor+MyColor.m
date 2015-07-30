//
//  UIColor+MyColor.m
//  EvaliOS
//
//  Created by Daniel Martin Jimenez on 22/6/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "UIColor+MyColor.h"

@implementation UIColor (MyColor)

+ (instancetype)customColor
{
    return [UIColor colorWithRed:9.0/255.0 green:41.0/255.0 blue:130.0/255.0 alpha:1.0];
}

+ (instancetype)customShadowColor
{
    return [UIColor colorWithRed:13.0/255.0 green:13.0/255.0 blue:13.0/255.0 alpha:1.0];
}

@end
