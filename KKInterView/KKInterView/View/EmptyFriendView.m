//
//  EmptyFriendView.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/16.
//

#import "EmptyFriendView.h"
#import "PureLayout.h"
#import "GradientButton.h"
#import <Foundation/Foundation.h>

@implementation EmptyFriendView

- (instancetype)init {
    self = [super init];
    if (self) {
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"imgFriendsEmpty"]];
        [self addSubview:image];
        [image autoSetDimensionsToSize:CGSizeMake(245, 172)];
        [image autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
        [image autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        UILabel *title = [[UILabel alloc] init];
        title.font = [UIFont fontWithName:@"PingFangTC-Medium" size:21];
        title.textColor = [UIColor colorWithRed:71.f/255 green:71.f/255 blue:71.f/255 alpha:1];
        title.textAlignment = NSTextAlignmentCenter;
        title.text = @"就從加好友開始吧：）";
        [self addSubview:title];
        [title autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:image withOffset:41];
        [title autoSetDimension:ALDimensionHeight toSize:29];
        [title autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        UILabel *detail = [[UILabel alloc] init];
        detail.font = [UIFont fontWithName:@"PingFangTC-Regular" size:14];
        detail.textColor = [UIColor colorWithRed:153.f/255 green:153.f/255 blue:153.f/255 alpha:1];
        detail.textAlignment = NSTextAlignmentCenter;
        detail.text = @"與好友們一起用 KOKO 聊起來！\n還能互相收付款、發紅包喔：）";
        detail.numberOfLines = 2;
        [self addSubview:detail];
        [detail autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:title withOffset:8];
        [detail autoSetDimension:ALDimensionHeight toSize:40];
        [detail autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        GradientButton *addFriendButton = [[GradientButton alloc] init];
        [self addSubview:addFriendButton];
        [addFriendButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:detail withOffset:25];
        [addFriendButton autoSetDimensionsToSize:CGSizeMake(192, 40)];
        [addFriendButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        UILabel *bottomLabel = [[UILabel alloc] init];
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
        [bottomLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 5, 0) excludingEdge:ALEdgeTop];
        [bottomLabel autoSetDimension:ALDimensionHeight toSize:18];
        
    }
    return self;
}

@end
