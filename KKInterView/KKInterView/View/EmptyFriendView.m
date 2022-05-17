//
//  EmptyFriendView.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/16.
//

#import "EmptyFriendView.h"
#import "GradientButton.h"
#import <Foundation/Foundation.h>

@implementation EmptyFriendView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 245) / 2, 30, 245, 172)];
        image.image = [UIImage imageNamed:@"imgFriendsEmpty"];
        [self addSubview:image];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(image.frame) + 41, frame.size.width - 60, 29)];
        title.font = [UIFont fontWithName:@"PingFangTC-Medium" size:21];
        title.textColor = [UIColor colorWithRed:71.f/255 green:71.f/255 blue:71.f/255 alpha:1];
        title.textAlignment = NSTextAlignmentCenter;
        title.text = @"就從加好友開始吧：）";
        [self addSubview:title];
        
        UILabel *detail = [[UILabel alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(title.frame) + 8, frame.size.width - 60, 40)];
        detail.font = [UIFont fontWithName:@"PingFangTC-Regular" size:14];
        detail.textColor = [UIColor colorWithRed:153.f/255 green:153.f/255 blue:153.f/255 alpha:1];
        detail.textAlignment = NSTextAlignmentCenter;
        detail.text = @"與好友們一起用 KOKO 聊起來！\n還能互相收付款、發紅包喔：）";
        detail.numberOfLines = 2;
        [self addSubview:detail];
        
        GradientButton *addFriendButton = [[GradientButton alloc] initWithFrame:CGRectMake((frame.size.width - 192) / 2, CGRectGetMaxY(detail.frame) + 25, 192, 40)];
        [self addSubview:addFriendButton];
        
        UILabel *bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, frame.size.height - 18 - 5, frame.size.width - 60, 18)];
        bottomLabel.textAlignment = NSTextAlignmentCenter;
        NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:153.f/255 green:153.f/255 blue:153.f/255 alpha:1],
                                     NSFontAttributeName: [UIFont fontWithName:@"PingFangTC-Regular" size:13]};
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"幫助好友更快找到你？" attributes:attributes];
        NSDictionary *underlinedAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:236.f/255 green:0.f/255 blue:140.f/255 alpha:1],
                                               NSFontAttributeName: [UIFont fontWithName:@"PingFangTC-Regular" size:13],
                                               NSUnderlineStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle],
                                               NSUnderlineColorAttributeName: [UIColor colorWithRed:236.f/255 green:0.f/255 blue:140.f/255 alpha:1]
        };
        NSAttributedString *underlinedString = [[NSAttributedString alloc] initWithString:@"設定 KOKO ID" attributes:underlinedAttributes];
        [string appendAttributedString:underlinedString];
        bottomLabel.attributedText = string;
        [self addSubview:bottomLabel];
    }
    return self;
}

@end
