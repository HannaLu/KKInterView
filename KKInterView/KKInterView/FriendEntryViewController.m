//
//  FriendEntryViewController.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/11.
//

#import "FriendEntryViewController.h"
#import "FriendsListViewController.h"

@interface FriendEntryViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<NSString *> *entries;

@end

@implementation FriendEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.entries = @[@"無好友畫面", @"只有好友列表", @"好友列表含邀請"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = self.entries[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = title;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = self.entries[indexPath.row];
    FriendsListViewController *controller = [[FriendsListViewController alloc] initWithApiUrl:[self apiUrlForTitle:title]];
    controller.title = title;
    [self.navigationController pushViewController:controller animated:YES];
}

- (NSString *)apiUrlForTitle:(NSString *)title {
    if ([title isEqualToString:@"無好友畫面"]) {
        return @"https://dimanyen.github.io/friend4.json";
    } else if ([title isEqualToString:@"好友列表含邀請"]) {
        return @"https://dimanyen.github.io/friend3.json";
    } else {
        return @"";
    }
}

@end
