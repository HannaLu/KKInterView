//
//  ManObject.h
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ManObject : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *kokoId;

- (instancetype)initWithJson:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
