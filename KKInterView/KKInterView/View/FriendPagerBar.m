//
//  FriendPagerBar.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/16.
//

#import "FriendPagerBar.h"

@interface FriendPagerBar ()

@property (nonatomic, strong) UILabel *friendBadge;
@property (nonatomic, strong) UILabel *chatBadge;

@end

@implementation FriendPagerBar

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:252.f/255 green:252.f/255 blue:252.f/255 alpha:1];
        
        
    }
    return self;
}

@end
