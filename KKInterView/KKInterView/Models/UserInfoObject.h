//
//  UserInfoObject.h
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import <Foundation/Foundation.h>
#import "FriendCellModel.h"

@interface UserInfoObject : NSObject <FriendCellProtocol>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *kokoId;

- (instancetype)initWithJson:(NSDictionary *)json;

@end
