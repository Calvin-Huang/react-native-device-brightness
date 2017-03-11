//
//  RNDeviceBrightness.m
//  RNDeviceBrightness
//
//  Created by Calvin on 3/11/17.
//  Copyright © 2017 CapsLock. All rights reserved.
//

#import "RNDeviceBrightness.h"

@implementation RNDeviceBrightness

RCT_EXPORT_MODULE();

- (void)setBrightnessLevel:(float)brightnessLevel
{
    [UIScreen mainScreen].brightness = brightnessLevel;
}

- (float)brightnessLevel
{
    return [UIScreen mainScreen].brightness;
}

@end
