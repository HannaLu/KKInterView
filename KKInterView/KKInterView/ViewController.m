//
//  ViewController.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/11.
//

#import "ViewController.h"
#import "FriendEntryViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"imgTabbarBg"];
    self.tabBar.tintColor = UIColor.systemPinkColor;
    
    NSMutableArray<UIViewController *> *controllers = [NSMutableArray array];
    // 錢錢
    EmptyViewController *account = [[EmptyViewController alloc] init];
    UINavigationController *accountNav = [self customBarNavigationControllerWithRoot:account];
    accountNav.tabBarItem = [self tabBarItem:accountNav.tabBarItem setupInsetsAndImage:@"icTabbarProductsOff"];
    [controllers addObject:accountNav];
    
    // 朋友
    FriendEntryViewController *friend = [[FriendEntryViewController alloc] init];
    UINavigationController *friendNav = [self customBarNavigationControllerWithRoot:friend];
    friendNav.tabBarItem = [self tabBarItem:friendNav.tabBarItem setupInsetsAndImage:@"icTabbarFriendsOn"];
    [controllers addObject:friendNav];
    
    // KO
    EmptyViewController *koMenu = [[EmptyViewController alloc] init];
    UINavigationController *koMenuNav = [self customBarNavigationControllerWithRoot:koMenu];
//    koMenuNav.tabBarItem = [self tabBarItem:koMenuNav.tabBarItem setupInsetsAndImage:@"icTabbarHomeOff"];
    koMenuNav.tabBarItem.image = [[UIImage imageNamed:@"icTabbarHomeOff"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [controllers addObject:koMenuNav];
    
    // 記帳
    EmptyViewController *record = [[EmptyViewController alloc] init];
    UINavigationController *recordNav = [self customBarNavigationControllerWithRoot:record];
    recordNav.tabBarItem = [self tabBarItem:recordNav.tabBarItem setupInsetsAndImage:@"icTabbarManageOff"];
    [controllers addObject:recordNav];
    
    // 設定
    EmptyViewController *setting = [[EmptyViewController alloc] init];
    UINavigationController *settingNav = [self customBarNavigationControllerWithRoot:setting];
    settingNav.tabBarItem = [self tabBarItem:settingNav.tabBarItem setupInsetsAndImage:@"icTabbarSettingOff"];
    [controllers addObject:settingNav];
    
    [self setViewControllers:controllers animated:YES];
    
    self.selectedIndex = 1;
}


- (UITabBarItem *)tabBarItem:(UITabBarItem *)item setupInsetsAndImage:(NSString *)image {
    item.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    item.image = [UIImage imageNamed:image];
    return item;
}

- (UINavigationController *)customBarNavigationControllerWithRoot:(UIViewController *)root {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:root];
    
    // 左邊的項目
    NSMutableArray *items = [NSMutableArray array];
    // ATM
    UIImageView *atmIcon = [[UIImageView alloc] init];
    atmIcon.image = [UIImage imageNamed:@"icNavPinkWithdraw"];
    UIBarButtonItem *atmItem = [[UIBarButtonItem alloc] initWithCustomView:atmIcon];
    [items addObject:atmItem];
    
    // 間距
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    space.width = 24;
    [items addObject:space];
    
    // 轉帳
    UIImageView *transferIcon = [[UIImageView alloc] init];
    transferIcon.image = [UIImage imageNamed:@"icNavPinkTransfer"];
    UIBarButtonItem *transferItem = [[UIBarButtonItem alloc] initWithCustomView:transferIcon];
    [items addObject:transferItem];
    
    root.navigationItem.leftBarButtonItems = items;
    
    // 右邊的項目
    UIImageView *scanIcon = [[UIImageView alloc] init];
    scanIcon.image = [UIImage imageNamed:@"icNavPinkScan"];
    UIBarButtonItem *scanItem = [[UIBarButtonItem alloc] initWithCustomView:scanIcon];
    root.navigationItem.rightBarButtonItem = scanItem;
    
    return nav;
}

@end
