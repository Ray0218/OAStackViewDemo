//
//  PersonCenterViewController.m
//  OAStackViewDemo
//
//  Created by Ray on 16/1/12.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "DPCenterHeader.h"
#import "FirstTableViewController.h"
#import "SecondTableViewController.h"
#import "ThirdTableViewController.h"

@interface PersonCenterViewController ()
@property (nonatomic, strong) DPCenterHeader *headerView;
@property (nonatomic, strong) FirstTableViewController *firstView;
@property (nonatomic, strong) SecondTableViewController *secondView;
@property (nonatomic, strong) ThirdTableViewController *thirdView;

@end

@implementation PersonCenterViewController

-(FirstTableViewController*)firstView{
    if (_firstView == nil) {
        _firstView = [[FirstTableViewController alloc]init];
        _firstView.view.backgroundColor = [UIColor yellowColor];
    }
    
    return _firstView ;
}

-(SecondTableViewController*)secondView{
    if (_secondView == nil) {
        _secondView = [[SecondTableViewController alloc]init];
        _secondView.view.backgroundColor = [UIColor yellowColor];
    }
    
    return _secondView ;
}

-(ThirdTableViewController*)thirdView{
    if (_thirdView == nil) {
        _thirdView = [[ThirdTableViewController alloc]init];
        _thirdView.view.backgroundColor = [UIColor orangeColor];
    }
    
    return _thirdView ;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.headerView = [[DPCenterHeader alloc]init];
        self.headerView.backgroundColor = [UIColor greenColor] ;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor] ;
    
    self.containerView.frame = CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen]bounds])) ;

    
    NSArray *tableArray = [NSArray arrayWithObjects:self.firstView,self.secondView,self.thirdView, nil] ;
    [self setViewControllers:tableArray withDefaultIndex:0];
 
    
    
    
}

- (void)layoutHeaderViewAndTabBar {
    [super layoutHeaderViewAndTabBar];
    
    self.headerView.frame = CGRectMake(CGRectGetMinX(self.headerView.frame), CGRectGetMinY(self.headerView.frame), CGRectGetWidth(self.headerView.frame), CGRectGetHeight(self.headerView.frame) + CGRectGetHeight(self.tabBar.frame));
//    self.lineView.frame = CGRectMake(self.tabBar.dp_x, self.tabBar.dp_y - 1, self.tabBar.dp_width, 1);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
