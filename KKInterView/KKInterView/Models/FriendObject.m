//
//  FriendObject.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import "FriendObject.h"

@implementation FriendObject

- (instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        if ([json[@"name"] isKindOfClass:NSString.class]) {
            self.name = json[@"name"];
        }
        
        if ([json[@"status"] isKindOfClass:NSNumber.class]) {
            self.status = [json[@"status"] integerValue];
        }
        
        if ([json[@"isTop"] isKindOfClass:NSString.class]) {
            self.isTop = json[@"isTop"];
        }
        
        if ([json[@"fid"] isKindOfClass:NSString.class]) {
            self.friendId = json[@"fid"];
        }
        
        if ([json[@"updateDate"] isKindOfClass:NSString.class]) {
            self.updateDate = json[@"updateDate"];
            self.updateDate = [self.updateDate stringByReplacingOccurrencesOfString:@"/" withString:@""];
        }
    }
    
    return self;
}

+ (NSMutableArray<FriendObject *> *)friendListWithJson:(NSArray *)json {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *data in json) {
        FriendObject *friend = [[FriendObject alloc] initWithJson:data];
        [array addObject:friend];
    }
    return array;
}

@end
