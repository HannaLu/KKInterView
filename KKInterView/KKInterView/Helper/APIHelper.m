//
//  APIHelper.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import "APIHelper.h"

@implementation APIHelper

+ (instancetype)sharedInstance {
    static APIHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[APIHelper alloc] init];
    });
    return sharedInstance;
}

- (void)callAPI:(NSString*)url completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler {
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [[defaultSession dataTaskWithRequest:urlRequest
                       completionHandler:completionHandler] resume];
}

- (void)callAPI:(NSString*)url response:(void (^)(NSDictionary * _Nullable json, NSError * _Nullable error))completionHandler {
    [self callAPI:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completionHandler(nil, error);
            return;
        }
        NSError* error1;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&error1];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(json, error1);
        });
    }];
}

+ (UIAlertController *)alertForAPIError {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"網路傳輸發生錯誤" message:@"請稍後再試" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:confirm];
    return alert;
}

- (void)getUerInfoCompletion:(void(^)(NSDictionary * _Nullable responseData, NSError * _Nullable error))completeBlock {
    [self callAPI:@"https://dimanyen.github.io/man.json" completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completeBlock(nil, error);
            return;
        }
        NSError* error1;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&error1];
        dispatch_async(dispatch_get_main_queue(), ^{
            completeBlock(json, error1);
        });
    }];
}

- (void)apiUrl:(NSString *)urlString andCompletion:(void (^)(NSDictionary * _Nullable responseData, NSError * _Nullable error))completeBlock {
    [self callAPI:urlString completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completeBlock(nil, error);
            return;
        }
        NSError* error1;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&error1];
        dispatch_async(dispatch_get_main_queue(), ^{
            completeBlock(json, error1);
        });
    }];
}

- (void)getFreindListCompletion:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completeBlock {
    [self callAPI:@"https://dimanyen.github.io/friend1.json" completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completeBlock(nil, error);
            return;
        }
        NSError* error1;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&error1];
        dispatch_async(dispatch_get_main_queue(), ^{
            completeBlock(json, error1);
        });
    }];
}

- (void)getFreindListWithFormedUpdateDateCompletion:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completeBlock {
    [self callAPI:@"https://dimanyen.github.io/friend2.json" completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completeBlock(nil, error);
            return;
        }
        NSError* error1;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&error1];
        dispatch_async(dispatch_get_main_queue(), ^{
            completeBlock(json, error1);
        });
    }];
}

- (void)getFreindListWithInvitingListCompletion:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completeBlock {
    [self callAPI:@"https://dimanyen.github.io/friend3.json" completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completeBlock(nil, error);
            return;
        }
        NSError* error1;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
        dispatch_async(dispatch_get_main_queue(), ^{
            completeBlock(json, error1);
        });
    }];
}

- (void)getFreindListEmptyCompletion:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completeBlock {
    [self callAPI:@"https://dimanyen.github.io/friend4.json" completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completeBlock(nil, error);
            return;
        }
        NSError* error1;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
        dispatch_async(dispatch_get_main_queue(), ^{
            completeBlock(json, error1);
        });
    }];
}

@end
