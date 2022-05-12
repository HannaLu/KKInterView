//
//  FriendObject.h
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import <Foundation/Foundation.h>

typedef enum: NSInteger {
    InviteStatusUnknown,
    InviteStatusInvited = 0,
    InviteStatusComplete = 1,
    InviteStatusInviteYou = 2,
} InviteStatus;

@interface FriendObject : NSObject
/// 姓名
@property (nonatomic, strong) NSString *name;

///
@property (nonatomic, assign) InviteStatus status;

///
@property (nonatomic, strong) NSString *isTop;

///
@property (nonatomic, strong) NSString *friendId;

///
@property (nonatomic, strong) NSString *updateDate;

@end
