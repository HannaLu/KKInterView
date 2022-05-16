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
