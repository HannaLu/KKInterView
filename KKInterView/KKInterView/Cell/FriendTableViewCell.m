//
//  FriendTableViewCell.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/17.
//

#import "FriendTableViewCell.h"

@interface FriendTableViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *transferButton;
@property (nonatomic, strong) UIButton *invitingButton;

@end

@implementation FriendTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGSize size = CGSizeMake(UIScreen.mainScreen.bounds.size.width, 60);
        UIImageView *userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(50, 10, 40, 40)];
        userIcon.image = [UIImage imageNamed:@"imgFriendsList"];
        [self.contentView addSubview:userIcon];
        
        UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        moreButton.frame = CGRectMake(size.width - 30 - 18, 28, 18, 4);
        [moreButton setImage:[UIImage imageNamed:@"icFriendsMore"] forState:UIControlStateNormal];
        [self.contentView addSubview:moreButton];
        
        
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(105, 59, size.width - 105 - 30, 1)];
        line.backgroundColor = [UIColor colorWithRed:228.f/255 green:228.f/255 blue:228.f/255 alpha:1];
        [self.contentView addSubview:line];
    }
    return self;
}

@end
