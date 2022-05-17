//
//  EmptyFriendTableViewCell.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/16.
//

#import "EmptyFriendTableViewCell.h"
#import "EmptyFriendView.h"
#import "DeviceInfo.h"

@implementation EmptyFriendTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        CGFloat height = UIScreen.mainScreen.bounds.size.height - [DeviceInfo topBarHeight] - 128 - [DeviceInfo bottomBarHeight];
        EmptyFriendView *emptyView = [[EmptyFriendView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, height)];
        [self.contentView addSubview:emptyView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
