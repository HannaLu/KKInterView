//
//  UserInfoCellTableViewCell.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import "UserInfoCellTableViewCell.h"
#import "UserInfoObject.h"
#import "UserInfoView.h"

@interface UserInfoCellTableViewCell ()

@property (nonatomic, strong) UserInfoView *userView;

@end

@implementation UserInfoCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.userView = [[UserInfoView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 90)];
        [self.contentView addSubview:self.userView];
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
