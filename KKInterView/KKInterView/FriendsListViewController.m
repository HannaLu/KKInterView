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

@interface FriendsListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *entries;

@property (nonatomic, strong) UserInfoObject *user;
@property (nonatomic, strong) NSMutableArray<FriendObject *> *friendList;

@end

@implementation FriendsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"Cell"];
    [self.tableView registerClass:UserInfoCellTableViewCell.class forCellReuseIdentifier:@"UserInfoCellTableViewCell"];
    [self.view addSubview:self.tableView];
    [self.tableView autoPinEdgesToSuperviewEdges];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.entries = [NSMutableArray array];
    
    [[APIHelper sharedInstance] getUerInfoCompletion:^(NSDictionary * _Nullable responseData, NSError * _Nullable error) {
        if (error) {
            [self presentViewController:[APIHelper alertForAPIError] animated:YES completion:nil];
        } else {
            if ([responseData[@"response"] isKindOfClass:NSArray.class]) {
                self.user = [[UserInfoObject alloc] initWithJson:responseData[@"response"][0]];
                FriendCellModel *cellModel = [[FriendCellModel alloc] initWithType:FriendCellTypeUserInfo andContent:self.user];
                [self.entries addObject:@[cellModel]];
            }
            [self.tableView reloadData];
        }
    }];
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
                return 128;
            }
                break;
            case FriendCellTypeInviting:
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
