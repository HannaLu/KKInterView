//
//  SearchBarTableViewCell.h
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/18.
//

#import <UIKit/UIKit.h>

@protocol SearchBarTableViewCellDelegate <NSObject, UISearchBarDelegate>

@end

@interface SearchBarTableViewCell : UITableViewCell

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, weak) id <SearchBarTableViewCellDelegate> delegate;

@end
