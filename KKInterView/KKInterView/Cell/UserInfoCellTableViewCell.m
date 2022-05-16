//
//  UserInfoCellTableViewCell.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import "UserInfoCellTableViewCell.h"
#import "PureLayout.h"
#import "UserInfoObject.h"
#import "UserInfoView.h"

@interface UserInfoCellTableViewCell ()

@property (nonatomic, strong) UserInfoView *userView;

@end

@implementation UserInfoCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.separatorInset = UIEdgeInsetsMake(0, CGFLOAT_MAX, 0, 0);
        
        self.userView = [[UserInfoView alloc] init];
        [self.contentView addSubview:self.userView];
        [self.userView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.userView autoSetDimension:ALDimensionHeight toSize:90];
    }
    return self;
}

- (void)setupContent:(id<FriendCellProtocol>)content {
    if ([content isKindOfClass:UserInfoObject.class]) {
        UserInfoObject *user = (UserInfoObject *)content;
        [self.userView setupUserInfo:user];
    }
}

@end
