//
//  FriendsListViewController.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/12.
//

#import "FriendsListViewController.h"
#import "UserInfoObject.h"
#import "FriendObject.h"
#import "APIHelper.h"
#import "FriendCellModel.h"
#import "UserInfoCellTableViewCell.h"
#import "PureLayout.h"
#import "EmptyFriendTableViewCell.h"
#import "UserInfoView.h"
#import "DeviceInfo.h"
#import "EmptyFriendView.h"

@interface FriendsListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *entries;

@property (nonatomic, strong) UserInfoObject *user;
@property (nonatomic, strong) NSMutableArray<FriendObject *> *friendList;
@property (nonatomic, strong) NSString *apiUrlString;
@property (nonatomic, strong) EmptyFriendView *emptyView;

@end

@implementation FriendsListViewController

- (instancetype)initWithApiUrl:(NSString *)urlString {
    self = [super init];
    if (self) {
        self.apiUrlString = urlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:[DeviceInfo topBarHeight]];
    [self registerAllCells];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self fetchData];
}

#pragma mark - Private method
- (void)registerAllCells {
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"Cell"];
    [self.tableView registerClass:UserInfoCellTableViewCell.class forCellReuseIdentifier:@"UserInfoCellTableViewCell"];
    [self.tableView registerClass:EmptyFriendTableViewCell.class forCellReuseIdentifier:@"EmptyFriendTableViewCell"];
}

- (void) fetchData {
    self.entries = [NSMutableArray array];
    self.friendList = [NSMutableArray array];
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [[APIHelper sharedInstance] getUerInfoCompletion:^(NSDictionary * _Nullable responseData, NSError * _Nullable error) {
        if (error) {
            [self presentViewController:[APIHelper alertForAPIError] animated:YES completion:nil];
        } else {
            if ([responseData[@"response"] isKindOfClass:NSArray.class]) {
                self.user = [[UserInfoObject alloc] initWithJson:responseData[@"response"][0]];
            }
        }
        dispatch_group_leave(group);
    }];
    
    if (self.apiUrlString.length > 0 ) {
        dispatch_group_enter(group);
        [[APIHelper sharedInstance] apiUrl:self.apiUrlString andCompletion:^(NSDictionary * _Nullable responseData, NSError * _Nullable error) {
            if (error) {
                [self presentViewController:[APIHelper alertForAPIError] animated:YES completion:nil];
            } else {
                if ([responseData[@"response"] isKindOfClass:NSArray.class]) {
                    [self.friendList addObjectsFromArray:[FriendObject friendListWithJson:responseData[@"response"]]];
                }
            }
            dispatch_group_leave(group);
        }];
    } else {
        dispatch_group_enter(group);
        [[APIHelper sharedInstance] getFreindListCompletion:^(NSDictionary * _Nullable responseData, NSError * _Nullable error) {
            if (error) {
                [self presentViewController:[APIHelper alertForAPIError] animated:YES completion:nil];
            } else {
                if ([responseData[@"response"] isKindOfClass:NSArray.class]) {
                    [self.friendList addObjectsFromArray:[FriendObject friendListWithJson:responseData[@"response"]]];
                }
            }
            dispatch_group_leave(group);
        }];
        
        dispatch_group_enter(group);
        [[APIHelper sharedInstance] getFreindListWithFormedUpdateDateCompletion:^(NSDictionary * _Nullable responseData, NSError * _Nullable error) {
            if (error) {
                [self presentViewController:[APIHelper alertForAPIError] animated:YES completion:nil];
            } else {
                if ([responseData[@"response"] isKindOfClass:NSArray.class]) {
                    [self.friendList addObjectsFromArray:[FriendObject friendListWithJson:responseData[@"response"]]];
                }
            }
            dispatch_group_leave(group);
        }];
    }
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 如果是無好友的狀態、手動把kokoId清掉以顯示未設定ID的layout
        if (self.friendList.count == 0) {
            self.user.kokoId = @"";
        }
        FriendCellModel *userInfo = [[FriendCellModel alloc] initWithType:FriendCellTypeUserInfo andContent:self.user];
        [self.entries addObject:@[userInfo]];
        if (self.friendList.count > 0) {
            
        } else {
            FriendCellModel *empty = [[FriendCellModel alloc] initWithType:FriendCellTypeInviting andContent:nil];
            [self.entries addObject:@[empty]];
            
        }
        self.tableView.scrollEnabled = self.friendList.count > 0;
        [self.tableView reloadData];
    });
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.entries.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.entries[section] isKindOfClass:NSArray.class]){
        NSArray *array = self.entries[section];
        return array.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *cellModels = self.entries[indexPath.section];
    if ([cellModels[indexPath.row] isKindOfClass:FriendCellModel.class]) {
        FriendCellModel *model = cellModels[indexPath.row];
        switch (model.type) {
            case FriendCellTypeUserInfo:
            {
                UserInfoCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoCellTableViewCell" forIndexPath:indexPath];
                [cell setupContent:model.content];
                return cell;
            }
                break;
            case FriendCellTypeInviting:
            {
                EmptyFriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmptyFriendTableViewCell" forIndexPath:indexPath];
                return cell;
            }
                break;
            case FriendCellTypeSearchBar:
                break;
            case FriendCellTypeFriend:
                break;
            default:
                break;
        }
    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *cellModels = self.entries[indexPath.section];
    if ([cellModels[indexPath.row] isKindOfClass:FriendCellModel.class]) {
        FriendCellModel *model = cellModels[indexPath.row];
        switch (model.type) {
            case FriendCellTypeUserInfo:
            {
                return 90;
            }
                break;
            case FriendCellTypeInviting:
            {
                return CGRectGetHeight(self.view.frame) - 128 - [DeviceInfo topBarHeight] - [DeviceInfo bottomBarHeight];
            }
                break;
            case FriendCellTypeSearchBar:
                break;
            case FriendCellTypeFriend:
                break;
            default:
                break;
        }
    }
    return CGFLOAT_MIN;
}

@end
