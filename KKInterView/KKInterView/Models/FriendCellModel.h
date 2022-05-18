//
//  FriendCellModel.h
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef enum: NSInteger {
    /// 使用者資訊
    FriendCellTypeUserInfo = 0,
    
    /// 邀請
    FriendCellTypeInviting = 1,
    
    /// 搜尋列
    FriendCellTypeSearchBar = 2,
    
    /// 好友
    FriendCellTypeFriend = 3,
    
    /// 無好友
    FriendCellTypeEmpty = 4,
    
    FriendCellTypeKnown
} FriendCellType;

@protocol FriendCellProtocol <NSObject>
@end

@interface FriendCellModel : NSObject

@property (nonatomic, assign) FriendCellType type;
@property (nonatomic, strong) id <FriendCellProtocol> content;
@property (nonatomic, assign) CGFloat cellHeight;

- (instancetype)initWithType:(FriendCellType)cellType andContent:(id <FriendCellProtocol>)contentObject;

@end
