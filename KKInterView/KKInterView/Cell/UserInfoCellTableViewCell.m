//
//  UserInfoCellTableViewCell.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import "UserInfoCellTableViewCell.h"
#import "PureLayout.h"
#import "UserInfoObject.h"

@interface UserInfoCellTableViewCell ()

@property (nonatomic, strong) UIImageView *userIcon;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *kokoIdButton;
@property (nonatomic, strong) UIView *noticeDotView;

@end

@implementation UserInfoCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.separatorInset = UIEdgeInsetsMake(0, CGFLOAT_MAX, 0, 0);
        
        // userIcon位置固定、由他來當基準
        self.userIcon = [[UIImageView alloc] init];
        self.userIcon.image = [UIImage imageNamed:@"imgFriendsList"];
        [self.contentView addSubview:self.userIcon];
        [self.userIcon autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:22];
        [self.userIcon autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
        [self.userIcon autoSetDimensionsToSize:CGSizeMake(52, 54)];
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = [UIFont fontWithName:@"PingFangTC-Medium" size:17];
        self.nameLabel.textColor = [UIColor colorWithRed:71/255 green:71/255 blue:71/255 alpha:1];
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
        [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
        [self.nameLabel autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:self.userIcon withOffset:-15];
        [self.nameLabel autoSetDimension:ALDimensionHeight toSize:18];
        
        self.kokoIdButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.kokoIdButton setTitle:@"KOKO ID：" forState:UIControlStateNormal];
        [self.kokoIdButton setTitleColor:[UIColor colorWithRed:71/255 green:71/255 blue:71/255 alpha:1] forState:UIControlStateNormal];
        self.kokoIdButton.titleLabel.font = [UIFont fontWithName:@"PingFangTC-Regular" size:13];
        [self.contentView addSubview:self.kokoIdButton];
        [self.kokoIdButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:8];
        [self.kokoIdButton autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
        [self.kokoIdButton autoSetDimension:ALDimensionHeight toSize:18];
    }
    return self;
}

- (void)setupContent:(id<FriendCellProtocol>)content {
    if ([content isKindOfClass:UserInfoObject.class]) {
        UserInfoObject *user = (UserInfoObject *)content;
        self.nameLabel.text = user.name;
        [self.kokoIdButton setTitle:[NSString stringWithFormat:@"KOKO ID：%@", user.kokoId] forState:UIControlStateNormal];
    }
}

@end
