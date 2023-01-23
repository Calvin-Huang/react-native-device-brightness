//
//  RNDeviceBrightness.m
//  RNDeviceBrightness
//
//  Created by Calvin on 3/11/17.
//  Copyright © 2017 CapsLock. All rights reserved.
//

#import "RNDeviceBrightness.h"

@implementation RNDeviceBrightness

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setBrightnessLevel:(float)brightnessLevel)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIScreen mainScreen].brightness = brightnessLevel;
    });
}

RCT_REMAP_METHOD(getBrightnessLevel,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    resolve(@([UIScreen mainScreen].brightness));
}

@end
