//
//  UserInfoCellTableViewCell.h
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import <UIKit/UIKit.h>
#import "FriendCellModel.h"

@interface UserInfoCellTableViewCell : UITableViewCell

- (void)setupContent:(id <FriendCellProtocol>)content;

@end
