//
//  SearchBarTableViewCell.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/18.
//

#import "SearchBarTableViewCell.h"

@implementation SearchBarTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGSize size = CGSizeMake(UIScreen.mainScreen.bounds.size.width, 61);
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(30, 15, size.width - 30 - 69, 36)];
        self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
        self.searchBar.placeholder = @"想轉一筆給誰呢？";
        [self.contentView addSubview:self.searchBar];
        
        UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        addButton.frame = CGRectMake(CGRectGetMaxX(self.searchBar.frame) + 15, (size.height - 24) / 2, 24, 24);
        [addButton setImage:[UIImage imageNamed:@"icBtnAddFriends"] forState:UIControlStateNormal];
        [self.contentView addSubview:addButton];
    }
    return self;
}

- (void)setDelegate:(id<SearchBarTableViewCellDelegate>)delegate {
    _delegate = delegate;
    self.searchBar.delegate = delegate;
}

@end
