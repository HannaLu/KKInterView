//
//  InvitingTableViewCell.h
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/18.
//

#import <UIKit/UIKit.h>
#import "FriendCellModel.h"

@interface InvitingTableViewCell : UITableViewCell

@property (nonatomic, assign) BOOL isFolding;
- (void)setupContent:(id <FriendCellProtocol>)content;

@end
