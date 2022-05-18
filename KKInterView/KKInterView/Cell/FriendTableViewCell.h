//
//  FriendTableViewCell.h
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/17.
//

#import <UIKit/UIKit.h>
#import "FriendCellModel.h"

@interface FriendTableViewCell : UITableViewCell

- (void)setupContent:(id <FriendCellProtocol>)content;

@end
