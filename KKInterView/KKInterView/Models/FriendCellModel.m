//
//  FriendCellModel.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import "FriendCellModel.h"

@implementation FriendCellModel

- (instancetype)initWithType:(FriendCellType)cellType andContent:(id<FriendCellProtocol>)contentObject {
    self = [super init];
    if (self) {
        self.type = cellType;
        self.content = contentObject;
    }
    return self;
}

@end
