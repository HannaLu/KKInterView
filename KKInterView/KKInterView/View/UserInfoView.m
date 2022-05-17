//
//  UserInfoView.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/16.
//

#import "UserInfoView.h"

@interface UserInfoView ()

@property (nonatomic, strong) UIImageView *userIcon;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *kokoIdButton;
@property (nonatomic, strong) UIView *noticeDotView;

@end

@implementation UserInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:252.f/255 green:252.f/255 blue:252.f/255 alpha:1];
        
        self.userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width - 52 - 30, 22, 52, 54)];
        self.userIcon.image = [UIImage imageNamed:@"imgFriendsList"];
        [self addSubview:self.userIcon];
        
        CGFloat nameLabelWidth = frame.size.width - 30 - 15 - CGRectGetWidth(self.userIcon.frame) - 30;
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, nameLabelWidth, 18)];
        self.nameLabel.font = [UIFont fontWithName:@"PingFangTC-Medium" size:17];
        self.nameLabel.textColor = [UIColor colorWithRed:71.f/255 green:71.f/255 blue:71.f/255 alpha:1];
        self.nameLabel.text = @"";
        [self addSubview:self.nameLabel];
        
        self.kokoIdButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.kokoIdButton.frame = CGRectMake(30, CGRectGetMaxY(self.nameLabel.frame) + 8, 100, 18);
        [self.kokoIdButton setTitleColor:[UIColor colorWithRed:71.f/255 green:71.f/255 blue:71.f/255 alpha:1] forState:UIControlStateNormal];
        self.kokoIdButton.titleLabel.font = [UIFont fontWithName:@"PingFangTC-Regular" size:13];
        [self.kokoIdButton setTitle:@"設定KOKO ID" forState:UIControlStateNormal];
        [self.kokoIdButton setImage:[UIImage imageNamed:@"icInfoBackDeepGray"] forState:UIControlStateNormal];
        
        self.kokoIdButton.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        self.kokoIdButton.titleLabel.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        self.kokoIdButton.imageView.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        
        [self addSubview:self.kokoIdButton];
        
        self.noticeDotView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.kokoIdButton.frame) + 15, CGRectGetMaxY(self.nameLabel.frame) + 12, 10, 10)];
        self.noticeDotView.backgroundColor = [UIColor colorWithRed:236.f/255 green:0.f/255 blue:140.f/255 alpha:1];
        [self addSubview:self.noticeDotView];
        self.noticeDotView.layer.cornerRadius = 5;
        self.noticeDotView.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setupUserInfo:(UserInfoObject *)user {
    self.nameLabel.text = user.name;
    if (user.kokoId.length == 0) {
        [self.kokoIdButton setTitle:@"設定KOKO ID" forState:UIControlStateNormal];
    } else {
        [self.kokoIdButton setTitle:[NSString stringWithFormat:@"KOKO ID：%@", user.kokoId] forState:UIControlStateNormal];
        [self.kokoIdButton sizeToFit];
    }
    self.noticeDotView.hidden = user.kokoId.length > 0;
}

@end
