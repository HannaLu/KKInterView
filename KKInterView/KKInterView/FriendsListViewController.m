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
#import "EmptyFriendTableViewCell.h"
#import "SearchBarTableViewCell.h"
#import "FriendTableViewCell.h"
#import "InvitingTableViewCell.h"
#import "DeviceInfo.h"
#import "FriendPagerBar.h"

@interface FriendsListViewController () <UITableViewDataSource, UITableViewDelegate, SearchBarTableViewCellDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *entries;

@property (nonatomic, strong) UserInfoObject *user;
@property (nonatomic, strong) NSMutableArray<FriendObject *> *friendList;
@property (nonatomic, strong) NSMutableArray<FriendObject *> *invitingList;
@property (nonatomic, strong) NSString *apiUrlString;

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@property (nonatomic, assign) BOOL isInvitingListFolding;

@end

@implementation FriendsListViewController

- (instancetype)initWithApiUrl:(NSString *)urlString {
    self = [super initWithNibName:@"FriendsListViewController" bundle:nil];
    if (self) {
        self.apiUrlString = urlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.sectionHeaderTopPadding = 0;
    [self registerAllCells];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchData) forControlEvents:UIControlEventValueChanged];
    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = self.refreshControl;
    } else {
        [self.tableView addSubview:self.refreshControl];
    }
    
    self.isInvitingListFolding = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchData];
}

#pragma mark - Private method
- (void)registerAllCells {
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"Cell"];
    [self.tableView registerClass:UserInfoCellTableViewCell.class forCellReuseIdentifier:@"UserInfoCellTableViewCell"];
    [self.tableView registerClass:EmptyFriendTableViewCell.class forCellReuseIdentifier:@"EmptyFriendTableViewCell"];
    [self.tableView registerClass:FriendTableViewCell.class forCellReuseIdentifier:@"FriendTableViewCell"];
    [self.tableView registerClass:SearchBarTableViewCell.class forCellReuseIdentifier:@"SearchBarTableViewCell"];
    [self.tableView registerClass:InvitingTableViewCell.class forCellReuseIdentifier:@"InvitingTableViewCell"];
}

- (void) fetchData {
    if (self.editing) {
        [self.refreshControl endRefreshing];
        return;
    }
    self.entries = [NSMutableArray array];
    self.friendList = [NSMutableArray array];
    self.invitingList = [NSMutableArray array];
    
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
        [self.refreshControl endRefreshing];
        // 如果是無好友的狀態、手動把kokoId清掉以顯示未設定ID的layout
        if (self.friendList.count == 0) {
            self.user.kokoId = @"";
        }
        FriendCellModel *userInfo = [[FriendCellModel alloc] initWithType:FriendCellTypeUserInfo andContent:self.user];
        [self.entries addObject:@[userInfo]];
        if (self.friendList.count > 0) {
            [self updateFriendList];
            [self.entries addObject:[self cellModelType:FriendCellTypeInviting ForFriends:self.invitingList]];
            
            FriendCellModel *searchBar = [[FriendCellModel alloc] initWithType:FriendCellTypeSearchBar andContent:nil];
            [self.entries addObject:@[searchBar]];
            [self.entries addObject:[self cellModelType:FriendCellTypeFriend ForFriends:self.friendList]];
        } else {
            FriendCellModel *empty = [[FriendCellModel alloc] initWithType:FriendCellTypeEmpty andContent:nil];
            [self.entries addObject:@[empty]];
            
        }
        [self.tableView reloadData];
    });
}

- (void)updateFriendList {
    NSMutableDictionary *friendInfo = [NSMutableDictionary dictionary];
    NSMutableArray *processedFriends = [NSMutableArray array];
    for (FriendObject *friend in self.friendList) {
        if (friendInfo[friend.friendId] == nil) {
            [processedFriends addObject:friend];
            friendInfo[friend.friendId] = @([processedFriends indexOfObject:friend]);
        } else {
            NSInteger index = [friendInfo[friend.friendId] integerValue];
            FriendObject *friendSaved = processedFriends[index];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"YYYYMMdd"];
            NSDate *dateSaved = [formatter dateFromString:friendSaved.updateDate];
            NSDate *dateNew = [formatter dateFromString:friend.updateDate];
            if ([dateSaved compare:dateNew] == NSOrderedAscending) {
                //dateNew 比較新
                processedFriends[index] = friend;
            }
        }
    }
    
    NSPredicate *friendPredicate = [NSPredicate predicateWithBlock:^BOOL(FriendObject *friend, NSDictionary<NSString *,id> * _Nullable bindings) {
        return friend.status != InviteStatusInviteYou;
    }];
    self.friendList = [NSMutableArray arrayWithArray:[processedFriends filteredArrayUsingPredicate:friendPredicate]];
    
    NSPredicate *invitingPredicate = [NSPredicate predicateWithBlock:^BOOL(FriendObject *friend, NSDictionary<NSString *,id> * _Nullable bindings) {
        return friend.status == InviteStatusInviteYou;
    }];
    self.invitingList = [NSMutableArray arrayWithArray:[processedFriends filteredArrayUsingPredicate:invitingPredicate]];
}

- (NSMutableArray<FriendCellModel *> *)cellModelType:(FriendCellType)type ForFriends:(NSArray<FriendObject *> *)friends {
    NSMutableArray *array = [NSMutableArray array];
    for (FriendObject *friend in friends) {
        FriendCellModel *friendModel = [[FriendCellModel alloc] initWithType:type andContent:friend];
        [array addObject:friendModel];
    }
    return array;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.entries.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.entries[section] isKindOfClass:NSArray.class]){
        NSArray *array = self.entries[section];
        // 邀請section摺疊時只顯示一筆
        if (self.invitingList.count > 0 && section == 1) {
            return self.isInvitingListFolding ? 1 : array.count;
        }
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
                InvitingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InvitingTableViewCell" forIndexPath:indexPath];
                [cell setupContent:model.content];
                cell.isFolding = self.isInvitingListFolding;
                return cell;
            }
                break;
            case FriendCellTypeSearchBar:
            {
                SearchBarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchBarTableViewCell" forIndexPath:indexPath];
                cell.delegate = self;
                return cell;
            }
                break;
            case FriendCellTypeFriend:
            {
                FriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendTableViewCell" forIndexPath:indexPath];
                [cell setupContent:model.content];
                return cell;
            }
                break;
            case FriendCellTypeEmpty:
            {
                EmptyFriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmptyFriendTableViewCell" forIndexPath:indexPath];
                return cell;
            }
                break;
            default:
                break;
        }
    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    // searchBar
    if (section == self.entries.count - 2) {
        return [[FriendPagerBar alloc] init];
    }
    
    return [[UIView alloc] init];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *cellModels = self.entries[indexPath.section];
    if ([cellModels[indexPath.row] isKindOfClass:FriendCellModel.class]) {
        FriendCellModel *model = cellModels[indexPath.row];
        switch (model.type) {
            case FriendCellTypeUserInfo:
                return self.isEditing ? 0 : 90;
                break;
            case FriendCellTypeInviting:
                return self.isInvitingListFolding ? 100 : 85;
                break;
            case FriendCellTypeSearchBar:
                return 61;
                break;
            case FriendCellTypeFriend:
                return 60;
                break;
            case FriendCellTypeEmpty:
                return CGRectGetHeight(self.view.frame) - 128 - [DeviceInfo topBarHeight] - [DeviceInfo bottomBarHeight];
                break;
            default:
                break;
        }
    }
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == self.entries.count - 2) {
        return self.isEditing ? 0 : 38;
    }
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        self.isInvitingListFolding = !self.isInvitingListFolding;
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.isEditing) {
        [self setEditing:NO];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:self.entries.count - 2];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        if ([cell isKindOfClass:SearchBarTableViewCell.class]) {
            SearchBarTableViewCell *searchBarCell = (SearchBarTableViewCell *)cell;
            [searchBarCell.searchBar resignFirstResponder];
        }
        
        NSIndexSet *set = [NSIndexSet indexSetWithIndex:0];
        [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - SearchBarTableViewCellDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self setEditing:YES];
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:0];
    [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(FriendObject *friend, NSDictionary<NSString *,id> * _Nullable bindings) {
        return [friend.name containsString:searchText];
    }];
    NSArray *result = [self.friendList filteredArrayUsingPredicate:predicate];
    if (result.count > 0) {
        self.entries[self.entries.count - 1] = [self cellModelType:FriendCellTypeFriend ForFriends:result];
    } else {
        self.entries[self.entries.count - 1] = [self cellModelType:FriendCellTypeFriend ForFriends:self.friendList];
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:self.entries.count - 1] withRowAnimation:UITableViewRowAnimationFade];
}

@end
