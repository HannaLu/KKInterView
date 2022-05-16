//
//  EmptyFriendTableViewCell.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/16.
//

#import "EmptyFriendTableViewCell.h"
#import "EmptyFriendView.h"
#import "PureLayout.h"

@implementation EmptyFriendTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.separatorInset = UIEdgeInsetsMake(0, CGFLOAT_MAX, 0, 0);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        EmptyFriendView *emptyView = [[EmptyFriendView alloc] init];
        [self.contentView addSubview:emptyView];
        [emptyView autoPinEdgesToSuperviewEdges];
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
