//
//  FriendPagerBar.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/16.
//

#import "FriendPagerBar.h"

@interface FriendPagerBar ()

@property (nonatomic, strong) UILabel *friendBadge;
@property (nonatomic, strong) UILabel *chatBadge;

@end

@implementation FriendPagerBar

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:252.f/255 green:252.f/255 blue:252.f/255 alpha:1];
        UILabel *friendTag = [[UILabel alloc] initWithFrame:CGRectMake(32, 10, 26, 18)];
        friendTag.font = [UIFont fontWithName:@"PingFangTC-Medium" size:13];
        friendTag.textAlignment = NSTextAlignmentCenter;
        friendTag.textColor = [UIColor colorWithRed:71.f/255 green:71.f/255 blue:71.f/255 alpha:1];
        friendTag.text = @"朋友";
        [self addSubview:friendTag];
        
        self.friendBadge = [[UILabel alloc] initWithFrame:CGRectMake(60, 3, 18, 18)];
        self.friendBadge.font = [UIFont fontWithName:@"PingFangTC-Medium" size:12];
        self.friendBadge.textAlignment = NSTextAlignmentCenter;
        self.friendBadge.textColor = [UIColor whiteColor];
        self.friendBadge.backgroundColor = [UIColor colorWithRed:249.f/255 green:178.f/255 blue:220.f/255 alpha:1];
        [self addSubview:self.friendBadge];
        self.friendBadge.layer.cornerRadius = 9;
        self.friendBadge.layer.masksToBounds = YES;
        self.friendBadge.hidden = YES;

        UILabel *chatTag = [[UILabel alloc] initWithFrame:CGRectMake(94, 10, 26, 18)];
        chatTag.font = [UIFont fontWithName:@"PingFangTC-Medium" size:13];
        chatTag.textAlignment = NSTextAlignmentCenter;
        chatTag.textColor = [UIColor colorWithRed:71.f/255 green:71.f/255 blue:71.f/255 alpha:1];
        chatTag.text = @"聊天";
        [self addSubview:chatTag];
        
        self.chatBadge = [[UILabel alloc] initWithFrame:CGRectMake(123, 3, 38, 18)];
        self.chatBadge.font = [UIFont fontWithName:@"PingFangTC-Medium" size:12];
        self.chatBadge.textAlignment = NSTextAlignmentCenter;
        self.chatBadge.textColor = [UIColor whiteColor];
        self.chatBadge.backgroundColor = [UIColor colorWithRed:249.f/255 green:178.f/255 blue:220.f/255 alpha:1];
        [self addSubview:self.chatBadge];
        self.chatBadge.layer.cornerRadius = 9;
        self.chatBadge.layer.masksToBounds = YES;
        self.chatBadge.hidden = YES;
        
        UIView *indicator = [[UIView alloc] initWithFrame:CGRectMake(35, 34, 20, 3)];
        indicator.backgroundColor = [UIColor colorWithRed:236.f/255 green:0 blue:140.f/255 alpha:1];
        indicator.layer.cornerRadius = 1.5;
        indicator.layer.masksToBounds = YES;
        [self addSubview:indicator];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 37, UIScreen.mainScreen.bounds.size.width, 1)];
        line.backgroundColor = [UIColor colorWithRed:239.f/255 green:239.f/255 blue:239.f/255 alpha:1];
        [self addSubview:line];
    }
    return self;
}

@end
