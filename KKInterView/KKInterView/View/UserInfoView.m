//
//  UserInfoView.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/16.
//

#import "UserInfoView.h"
#import "PureLayout.h"

@interface UserInfoView ()

@property (nonatomic, strong) UIImageView *userIcon;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *kokoIdButton;
@property (nonatomic, strong) UIView *noticeDotView;

@end

@implementation UserInfoView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:252.f/255 green:252.f/255 blue:252.f/255 alpha:1];
        
        // userIcon位置固定、由他來當基準
        self.userIcon = [[UIImageView alloc] init];
        self.userIcon.image = [UIImage imageNamed:@"imgFriendsList"];
        [self addSubview:self.userIcon];
        [self.userIcon autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:22];
        [self.userIcon autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
        [self.userIcon autoSetDimensionsToSize:CGSizeMake(52, 54)];
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = [UIFont fontWithName:@"PingFangTC-Medium" size:17];
        self.nameLabel.textColor = [UIColor colorWithRed:71.f/255 green:71.f/255 blue:71.f/255 alpha:1];
        self.nameLabel.text = @"";
        [self addSubview:self.nameLabel];
        [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
        [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
        [self.nameLabel autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:self.userIcon withOffset:-15];
        [self.nameLabel autoSetDimension:ALDimensionHeight toSize:18];
        
        self.kokoIdButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.kokoIdButton setTitleColor:[UIColor colorWithRed:71.f/255 green:71.f/255 blue:71.f/255 alpha:1] forState:UIControlStateNormal];
        self.kokoIdButton.titleLabel.font = [UIFont fontWithName:@"PingFangTC-Regular" size:13];
        [self.kokoIdButton setTitle:@"設定KOKO ID" forState:UIControlStateNormal];
        [self.kokoIdButton setImage:[UIImage imageNamed:@"icInfoBackDeepGray"] forState:UIControlStateNormal];
        
        self.kokoIdButton.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        self.kokoIdButton.titleLabel.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        self.kokoIdButton.imageView.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        
        [self addSubview:self.kokoIdButton];
        [self.kokoIdButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:8];
        [self.kokoIdButton autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
        [self.kokoIdButton autoSetDimension:ALDimensionHeight toSize:18];
        
        self.noticeDotView = [[UIView alloc] init];
        self.noticeDotView.backgroundColor = [UIColor colorWithRed:236.f/255 green:0.f/255 blue:140.f/255 alpha:1];
        [self addSubview:self.noticeDotView];
        [self.noticeDotView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:12];
        [self.noticeDotView autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:self.kokoIdButton withOffset:15];
        [self.noticeDotView autoSetDimensionsToSize:CGSizeMake(10, 10)];
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
    }
    self.noticeDotView.hidden = user.kokoId.length > 0;
}

@end
