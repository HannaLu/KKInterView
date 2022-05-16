//
//  APIHelper.h
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface APIHelper : NSObject

+ (instancetype _Nonnull )sharedInstance;

/// API error alert
+ (UIAlertController *)alertForAPIError;

/// 個人資料
- (void)getUerInfoCompletion:(void(^_Nullable)(NSDictionary * _Nullable responseData, NSError * _Nullable error))completeBlock;

- (void)apiUrl:(NSString *)urlString andCompletion:(void(^_Nullable)(NSDictionary * _Nullable responseData, NSError * _Nullable error))completeBlock;

/// 好友列表1
- (void)getFreindListCompletion:(void(^_Nullable)(NSDictionary * _Nullable responseData, NSError * _Nullable error))completeBlock;

/// 好友列表2
- (void)getFreindListWithFormedUpdateDateCompletion:(void(^_Nullable)(NSDictionary * _Nullable responseData, NSError * _Nullable error))completeBlock;

/// 好友列表含邀請列表
- (void)getFreindListWithInvitingListCompletion:(void(^_Nullable)(NSDictionary * _Nullable responseData, NSError * _Nullable error))completeBlock;

/// 無資料邀請/好友列表
- (void)getFreindListEmptyCompletion:(void(^_Nullable)(NSDictionary * _Nullable responseData, NSError * _Nullable error))completeBlock;

@end
