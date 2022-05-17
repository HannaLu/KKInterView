//
//  GradientButton.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/16.
//

#import "GradientButton.h"
#import <QuartzCore/CAGradientLayer.h>
#import <CoreGraphics/CGColor.h>

@implementation GradientButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIColor *frogGreen = [UIColor colorWithRed:86.f/255 green:179.f/255 blue:11.f/255 alpha:1];
        UIColor *booger = [UIColor colorWithRed:166.f/255 green:204.f/255 blue:66.f/255 alpha:1] ;
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(__bridge id)frogGreen.CGColor, (__bridge id)booger.CGColor];
        gradientLayer.startPoint = CGPointMake(0, 0.5);
        gradientLayer.endPoint = CGPointMake(1.0, 0.5);
        gradientLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self.layer addSublayer:gradientLayer];
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = YES;
        
        UILabel *buttonTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        buttonTitle.font = [UIFont fontWithName:@"PingFangTC-Medium" size:16];
        buttonTitle.textColor = [UIColor whiteColor];
        buttonTitle.textAlignment = NSTextAlignmentCenter;
        buttonTitle.text = @"加好友";
        [self addSubview:buttonTitle];
        
        UIImageView *buttonIcon = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width - 24 - 8, (frame.size.height - 24) / 2, 24, 24)];
        buttonIcon.image = [UIImage imageNamed:@"icAddFriendWhite"];
        [self addSubview:buttonIcon];
    }
    return self;
}

@end
