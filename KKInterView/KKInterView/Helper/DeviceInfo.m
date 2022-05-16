//
//  DeviceInfo.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/16.
//

#import "DeviceInfo.h"

@implementation DeviceInfo

+ (CGFloat)topBarHeight {
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    CGFloat navigationBarHeight = 44;
    return statusBarSize.height + navigationBarHeight;
}

+ (CGFloat)bottomBarHeight {
    CGFloat bottomBarHeight = 50;
    UIWindow *keyWindow = [[[UIApplication sharedApplication] windows] firstObject];
    return keyWindow.safeAreaInsets.bottom + bottomBarHeight;
}

@end
