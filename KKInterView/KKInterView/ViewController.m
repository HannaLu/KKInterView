//
//  ViewController.m
//  KKInterView
//
//  Created by Hanna Lu on 2022/5/11.
//

#import "ViewController.h"
#import "FriendEntryViewController.h"
#import "KKInterView-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"imgTabbarBg"];
    
    NSMutableArray<UIViewController *> *controllers = [NSMutableArray array];
    // 錢錢
    EmptyViewController *account = [[EmptyViewController alloc] init];
    UINavigationController *accountNav = [[UINavigationController alloc] initWithRootViewController:account];
    accountNav.tabBarItem = [self tabBarItem:accountNav.tabBarItem setupInsetsAndImage:@"icTabbarProductsOff"];
    [controllers addObject:accountNav];
    
    // 朋友
    FriendEntryViewController *friend = [[FriendEntryViewController alloc] init];
    UINavigationController *friendNav = [[UINavigationController alloc] initWithRootViewController:friend];
    friendNav.tabBarItem = [self tabBarItem:friendNav.tabBarItem setupInsetsAndImage:@"icTabbarFriendsOn"];
    [controllers addObject:friendNav];
    
    // KO
    EmptyViewController *koMenu = [[EmptyViewController alloc] init];
    UINavigationController *koMenuNav = [[UINavigationController alloc] initWithRootViewController:koMenu];
    koMenuNav.tabBarItem = [self tabBarItem:koMenuNav.tabBarItem setupInsetsAndImage:@"icTabbarHomeOff"];
    [controllers addObject:koMenuNav];
    
    // 記帳
    EmptyViewController *record = [[EmptyViewController alloc] init];
    UINavigationController *recordNav = [[UINavigationController alloc] initWithRootViewController:record];
    recordNav.tabBarItem = [self tabBarItem:recordNav.tabBarItem setupInsetsAndImage:@"icTabbarManageOff"];
    [controllers addObject:recordNav];
    
    // 設定
    EmptyViewController *setting = [[EmptyViewController alloc] init];
    UINavigationController *settingNav = [[UINavigationController alloc] initWithRootViewController:setting];
    settingNav.tabBarItem = [self tabBarItem:settingNav.tabBarItem setupInsetsAndImage:@"icTabbarSettingOff"];
    [controllers addObject:settingNav];
    
    [self setViewControllers:controllers animated:YES];
}


- (UITabBarItem *)tabBarItem:(UITabBarItem *)item setupInsetsAndImage:(NSString *)image {
    item.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    item.image = [UIImage imageNamed:image];
    return item;
}

- (UINavigationController *)customBarNavigationControllerWithRoot:(UIViewController *)root {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:root];
    nav.navigationBar = [self defaultNavigationBar];
    
    return nav;
}

- (UINavigationBar *)defaultNavigationBar {
    UINavigationBar *bar = [[UINavigationBar alloc] init];
    
}

@end
