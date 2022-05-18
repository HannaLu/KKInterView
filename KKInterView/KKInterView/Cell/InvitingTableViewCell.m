//
//  InvitingTableViewCell.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/18.
//

#import "InvitingTableViewCell.h"
#import "FriendObject.h"

@interface InvitingTableViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIView *foldingView;

@end

@implementation InvitingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor colorWithRed:252.f/255 green:252.f/255 blue:252.f/255 alpha:1];
        
        self.foldingView = [[UIView alloc] initWithFrame:CGRectMake(40, 15, UIScreen.mainScreen.bounds.size.width - 40 - 40, 70)];
        self.foldingView.backgroundColor = [UIColor whiteColor];
        self.foldingView.layer.cornerRadius = 6;
        self.foldingView.layer.shadowOffset = CGSizeMake(0, 4);
        self.foldingView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.foldingView.layer.shadowRadius = 5;
        self.foldingView.layer.shadowOpacity = 0.4;
//        self.foldingView.hidden = YES;
        [self.contentView addSubview:self.foldingView];
        
        UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(30, 5, UIScreen.mainScreen.bounds.size.width - 30 - 30, 70)];
        shadowView.backgroundColor = [UIColor whiteColor];
        shadowView.layer.cornerRadius = 6;
        shadowView.layer.shadowOffset = CGSizeMake(0, 4);
        shadowView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        shadowView.layer.shadowRadius = 5;
        shadowView.layer.shadowOpacity = 0.4;
        [self.contentView addSubview:shadowView];
        
        UIView *cardView = [[UIView alloc] initWithFrame:CGRectMake(30, 5, UIScreen.mainScreen.bounds.size.width - 30 - 30, 70)];
        cardView.backgroundColor = [UIColor whiteColor];
        cardView.layer.cornerRadius = 6;
        cardView.layer.masksToBounds = YES;
        [self.contentView addSubview:cardView];
        
        CGSize size = shadowView.frame.size;
        
        UIImageView *userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 40, 40)];
        userIcon.image = [UIImage imageNamed:@"imgFriendsList"];
        [cardView addSubview:userIcon];
        
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame = CGRectMake(size.width - 15 - 30, (size.height - 30) / 2, 30, 30);
        [cancelButton setImage:[UIImage imageNamed:@"btnFriendsDelet"] forState:UIControlStateNormal];
        [cardView addSubview:cancelButton];
        
        UIButton *agreeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        agreeButton.frame = CGRectMake(CGRectGetMinX(cancelButton.frame) - 15 - 30, (size.height - 30) / 2, 30, 30);
        [agreeButton setImage:[UIImage imageNamed:@"btnFriendsAgree"] forState:UIControlStateNormal];
        [cardView addSubview:agreeButton];
        
        CGFloat width = CGRectGetMinX(agreeButton.frame) - CGRectGetMaxX(userIcon.frame) - 15 - 15;
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(userIcon.frame) + 15, 14, width, 22)];
        self.nameLabel.font = [UIFont fontWithName:@"PingFangTC-Medium" size:16];
        self.nameLabel.textColor = [UIColor colorWithRed:71.f/255 green:71.f/255 blue:71.f/255 alpha:1];
        self.nameLabel.text = @"";
        [cardView addSubview:self.nameLabel];
        
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(userIcon.frame) + 15, CGRectGetMaxY(self.nameLabel.frame) + 2, width, 18)];
        messageLabel.font = [UIFont fontWithName:@"PingFangTC-Regular" size:13];
        messageLabel.textColor = [UIColor colorWithRed:153.f/255 green:153.f/255 blue:153.f/255 alpha:1];
        messageLabel.text = @"邀請你成為好友：）";
        [cardView addSubview:messageLabel];
    }
    return self;
}

- (void)setIsFolding:(BOOL)isFolding {
    _isFolding = isFolding;
    self.foldingView.hidden = !isFolding;
}

- (void)setupContent:(id<FriendCellProtocol>)content {
    if ([content isKindOfClass:FriendObject.class]) {
        FriendObject *friendInfo = (FriendObject *)content;
        self.nameLabel.text = friendInfo.name;
    }
}

@end
