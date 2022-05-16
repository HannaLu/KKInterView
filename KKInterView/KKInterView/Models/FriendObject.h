//
//  FriendObject.h
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import <Foundation/Foundation.h>
#import "FriendCellModel.h"

typedef enum: NSInteger {
    InviteStatusUnknown,
    
    /// 邀請送出
    InviteStatusInvited = 0,
    
    /// 已完成
    InviteStatusComplete = 1,
    
    /// 邀請中
    InviteStatusInviteYou = 2,
} InviteStatus;

@interface FriendObject : NSObject <FriendCellProtocol>
/// 姓名
@property (nonatomic, strong) NSString *name;

/// 邀請狀態
@property (nonatomic, assign) InviteStatus status;

/// 是否出現星星
@property (nonatomic, strong) NSString *isTop;

/// 好友id
@property (nonatomic, strong) NSString *friendId;

/// 資料更新時間
@property (nonatomic, strong) NSString *updateDate;

@end
