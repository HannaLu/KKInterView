//
//  FriendTableViewCell.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/17.
//

#import "FriendTableViewCell.h"
#import "FriendObject.h"

@interface FriendTableViewCell ()

@property (nonatomic, strong) UIImageView *starIcon;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *transferButton;
@property (nonatomic, strong) UIButton *invitingButton;
@property (nonatomic, strong) UIButton *moreButton;

@end

@implementation FriendTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGSize size = CGSizeMake(UIScreen.mainScreen.bounds.size.width, 60);
        UIImageView *userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(50, 10, 40, 40)];
        userIcon.image = [UIImage imageNamed:@"imgFriendsList"];
        [self.contentView addSubview:userIcon];
        
        self.moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.moreButton.frame = CGRectMake(size.width - 30 - 18, 28, 18, 4);
        [self.moreButton setImage:[UIImage imageNamed:@"icFriendsMore"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.moreButton];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(userIcon.frame) + 15, (size.height - 22) / 2, 100, 22)];
        self.nameLabel.font = [UIFont fontWithName:@"PingFangTC-Regular" size:16];
        self.nameLabel.textColor = [UIColor colorWithRed:71.f/255 green:71.f/255 blue:71.f/255 alpha:1];
        [self.contentView addSubview:self.nameLabel];
        
        self.starIcon = [[UIImageView alloc] initWithFrame:CGRectMake(30, (size.height - 14) / 2, 14, 14)];
        self.starIcon.image = [UIImage imageNamed:@"icFriendsStar"];
        [self.contentView addSubview:self.starIcon];
        
        self.transferButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.transferButton.frame = CGRectMake(size.width - 73 - 47, 18, 47, 24);
        [self.transferButton setTitle:@"轉帳" forState:UIControlStateNormal];
        self.transferButton.titleLabel.font = [UIFont fontWithName:@"PingFangTC-Medium" size:14];
        [self.transferButton setTitleColor:[UIColor colorWithRed:236.f/255 green:0 blue:140.f/255 alpha:1] forState:UIControlStateNormal];
        self.transferButton.layer.borderWidth = 1.2;
        self.transferButton.layer.borderColor = [UIColor colorWithRed:236.f/255 green:0 blue:140.f/255 alpha:1].CGColor;
        self.transferButton.layer.cornerRadius = 2;
        self.transferButton.layer.masksToBounds = YES;
        [self.contentView addSubview:self.transferButton];
        
        self.invitingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.invitingButton.frame = CGRectMake(size.width - 20 - 60, 18, 60, 24);
        [self.invitingButton setTitle:@"邀請中" forState:UIControlStateNormal];
        self.invitingButton.titleLabel.font = [UIFont fontWithName:@"PingFangTC-Medium" size:14];
        [self.invitingButton setTitleColor:[UIColor colorWithRed:153.f/255 green:153.f/255 blue:153.f/255 alpha:1] forState:UIControlStateNormal];
        self.invitingButton.layer.borderWidth = 1.2;
        self.invitingButton.layer.borderColor = [UIColor colorWithRed:153.f/255 green:153.f/255 blue:153.f/255 alpha:1].CGColor;
        self.invitingButton.layer.cornerRadius = 2;
        self.invitingButton.layer.masksToBounds = YES;
        self.invitingButton.hidden = YES;
        [self.contentView addSubview:self.invitingButton];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(105, 59, size.width - 105 - 30, 1)];
        line.backgroundColor = [UIColor colorWithRed:228.f/255 green:228.f/255 blue:228.f/255 alpha:1];
        [self.contentView addSubview:line];
    }
    return self;
}

- (void)setupContent:(id)content {
    if ([content isKindOfClass:FriendObject.class]) {
        FriendObject *friendInfo = (FriendObject *)content;
        self.nameLabel.text = friendInfo.name;
        self.starIcon.hidden = ![friendInfo.isTop isEqualToString:@"1"];
        self.moreButton.hidden = friendInfo.status == InviteStatusInvited;
        self.invitingButton.hidden = friendInfo.status != InviteStatusInvited;
        
        CGSize size = CGSizeMake(UIScreen.mainScreen.bounds.size.width, 60);
        if (friendInfo.status == InviteStatusInvited) {
            self.transferButton.frame = CGRectMake(size.width - 90 - 47, 18, 47, 24);
        } else {
            self.transferButton.frame = CGRectMake(size.width - 73 - 47, 18, 47, 24);
        }
    }
}

@end
