//
//  UserInfoObject.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import "UserInfoObject.h"

@implementation UserInfoObject

- (instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.name = ([json[@"name"] isKindOfClass:NSString.class]) ? json[@"name"] : @"";
        self.kokoId = ([json[@"kokoid"] isKindOfClass:NSString.class]) ? json[@"kokoid"] : @"";
    }
    return self;
}

@end
