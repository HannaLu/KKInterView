//
//  GradientButton.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/16.
//

#import "GradientButton.h"
#import <QuartzCore/CAGradientLayer.h>
#import <CoreGraphics/CGColor.h>
#import "PureLayout.h"

@implementation GradientButton

- (instancetype)init {
    self = [super init];
    if (self) {
        UIColor *frogGreen = [UIColor colorWithRed:86.f/255 green:179.f/255 blue:11.f/255 alpha:1];
        UIColor *booger = [UIColor colorWithRed:166.f/255 green:204.f/255 blue:66.f/255 alpha:1] ;
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(__bridge id)frogGreen.CGColor, (__bridge id)booger.CGColor];
        gradientLayer.startPoint = CGPointMake(0, 0.5);
        gradientLayer.endPoint = CGPointMake(1.0, 0.5);
        gradientLayer.frame = CGRectMake(0, 0, 192, 40);
        [self.layer addSublayer:gradientLayer];
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = YES;
        
        UILabel *buttonTitle = [[UILabel alloc] init];
        buttonTitle.font = [UIFont fontWithName:@"PingFangTC-Medium" size:16];
        buttonTitle.textColor = [UIColor whiteColor];
        buttonTitle.textAlignment = NSTextAlignmentCenter;
        buttonTitle.text = @"加好友";
        [self addSubview:buttonTitle];
        [buttonTitle autoPinEdgesToSuperviewEdges];
        
        UIImageView *buttonIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icAddFriendWhite"]];
        [self addSubview:buttonIcon];
        [buttonIcon autoSetDimensionsToSize:CGSizeMake(24, 24)];
        [buttonIcon autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:8];
        [buttonIcon autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        self.layer.shadowOffset = CGSizeMake(0, 4);
        self.layer.shadowColor = [UIColor colorWithRed:121.f/255 green:196.f/255 blue:27.f/255 alpha:0.4].CGColor;
        self.layer.shadowRadius = 8;
    }
    return self;
}

@end
