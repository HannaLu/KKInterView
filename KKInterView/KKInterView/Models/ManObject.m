//
//  ManObject.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import "ManObject.h"

@implementation ManObject

- (instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.name = ([json[@"name"] isKindOfClass:NSString.class]) ? json[@"name"] : @"";
        self.kokoId = ([json[@"kokoId"] isKindOfClass:NSString.class]) ? json[@"kokoId"] : @"";
    }
    return self;
}

@end
