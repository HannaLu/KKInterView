//
//  APIHelper.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import "APIHelper.h"
#import "AFHTTPSessionManager.h"

@implementation APIHelper

+ (instancetype)sharedInstance {
    static APIHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[APIHelper alloc] init];
    });
    return sharedInstance;
}

+ (UIAlertController *)alertForAPIError {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"網路傳輸發生錯誤" message:@"請稍後再試" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:confirm];
    return alert;
}

- (void)getUerInfoCompletion:(void(^_Nullable)(NSDictionary * _Nullable responseData, NSError * _Nullable error))completeBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://dimanyen.github.io/man.json" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        completeBlock(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(nil, error);
    }];
}

- (void)apiUrl:(NSString *)urlString andCompletion:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completeBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        completeBlock(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(nil, error);
    }];
}

- (void)getFreindListCompletion:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completeBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://dimanyen.github.io/friend1.json" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        completeBlock(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(nil, error);
    }];
}

- (void)getFreindListWithFormedUpdateDateCompletion:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completeBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://dimanyen.github.io/friend2.json" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        completeBlock(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(nil, error);
    }];
}

- (void)getFreindListWithInvitingListCompletion:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completeBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://dimanyen.github.io/friend3.json" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        completeBlock(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(nil, error);
    }];
}

- (void)getFreindListEmptyCompletion:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completeBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://dimanyen.github.io/friend4.json" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        completeBlock(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(nil, error);
    }];
}

@end
