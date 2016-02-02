//
//  RootViewController.m
//  OAStackViewDemo
//
//  Created by Ray on 15/9/28.
//  Copyright (c) 2015年 Ray. All rights reserved.
//

#import "RootViewController.h"
 #import "DPScrollTableView.h"
#import "DPFirstIndexCell.h"
#import "DPBaseView.h"
#import "DPFirstView.h"
#import "DPSecondView.h"
#import "DPThirdView.h"
#import "DPFourthView.h"
#import "DPFiveView.h"


@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView *_currentTableView ;
    
}
@property (nonatomic, strong) DPScrollTableView *scrollTabelView ;
@property (nonatomic, strong) UIView *headerView ;
@property (nonatomic, strong) MASConstraint *tabbarCons ;

 @property (nonatomic, assign) CGFloat lastOffsetY ;

@property (nonatomic, strong) UITableView *tableview ;


@property (nonatomic ,strong) NSArray *tableDataArray ;
@property (nonatomic ,strong) DPTabBarView *tabBbarView ;

@end

static NSString *cellIdentify[] = {@"DPFirstIndexCell", @"DPSecondIndexCell"  , @"DPThirdIndexCell" , @"DPFouthIndexCell"} ;


@implementation RootViewController

-(NSArray*)tableDataArray{

    if (_tableDataArray == nil) {
        _tableDataArray = @[[[DPFirstView alloc]init],[[DPSecondView alloc]init] ,[[DPThirdView alloc]init],[[DPFourthView alloc]init],[[DPFiveView alloc]init]] ;
    }
    return _tableDataArray ;
}

 - (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     
     self.edgesForExtendedLayout = UIRectEdgeNone ;

     
     [self.view addSubview:self.tableview];
     [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.insets(UIEdgeInsetsZero) ;
     }];
     
     DPBaseView  *view = [self.tableDataArray objectAtIndex:0] ;
     
     self.tableview.dataSource = view ;
     self.tableview.delegate =view ;
     
     
     [self.view addSubview:self.tabBbarView];
     [self.tabBbarView mas_makeConstraints:^(MASConstraintMaker *make) {
        self.tabbarCons =  make.top.equalTo(self.view).offset(100) ;
         make.left.and.right.equalTo(self.view) ;
         make.height.mas_equalTo(40) ;
     }];
     
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"contentOffset"] ) {
        UITableView *view = (UITableView*)object ;
        
         if (self.tabbarCons) {
            
            if (view.contentOffset.y > 0 ) {
                self.tabbarCons.mas_offset(MAX(100- view.contentOffset.y,0)) ;
            }else{
                self.tabbarCons.mas_offset((100- view.contentOffset.y)) ;
                
            }
             
         }
        
        if (CGRectGetMaxY(self.tabBbarView.frame)) {
            if (CGRectGetMinY(self.tabBbarView.frame) == 0 ) {
                
                self.tableview.contentInset = UIEdgeInsetsMake(40, 0, 0, 0) ;
                
            }else{
                 self.tableview.contentInset = UIEdgeInsetsZero ;
            }

        }
        
        
        
//        NSLog(@"dragging = %d ,decelerating = %d ,tracking = %d",view.dragging,view.decelerating,view.tracking) ;
//
        
        self.lastOffsetY = view.contentOffset.y ;
        
        
        
    }
    
}


-(UITableView *)tableview{

    if (_tableview == nil) {
        _tableview = [[UITableView alloc]init];
        _tableview.backgroundColor = [UIColor grayColor] ;
        [_tableview registerClass:[DPFirstIndexCell class] forCellReuseIdentifier:@"DPFirstIndexCell"];
        [_tableview registerClass:[DPSecondIndexCell class] forCellReuseIdentifier:@"DPSecondIndexCell"];
        [_tableview registerClass:[DPThirdIndexCell class] forCellReuseIdentifier:@"DPThirdIndexCell"];
        [_tableview registerClass:[DPFouthIndexCell class] forCellReuseIdentifier:@"DPFouthIndexCell"];
        [_tableview registerClass:[DPFiveIndexCell class] forCellReuseIdentifier:@"DPFiveIndexCell"];

        [_tableview addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];        _tableview.tableHeaderView = ({
        
        
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 140)];
            view.backgroundColor = [UIColor blueColor] ;
            
            view ;
        });
    }
    
    return _tableview ;
}

-(DPTabBarView*)tabBbarView{

    if (_tabBbarView == nil) {
        _tabBbarView = [[DPTabBarView alloc]initWithTitles:@[@"全部",@"大支付",@"未完结",@"中奖"]];
        _tabBbarView.backgroundColor = [UIColor purpleColor] ;
        
        __weak typeof(self) weakSelf = self ;
        _tabBbarView.barselectd = ^(NSInteger index){
        
            weakSelf.tableview.delegate = weakSelf.tableDataArray[index]  ;
             weakSelf.tableview.dataSource = weakSelf.tableDataArray[index] ;
            [weakSelf.tableview reloadData];
        } ;
    }
    
    return _tabBbarView ;
}


/*

 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view.
 
 
 
 self.edgesForExtendedLayout = UIRectEdgeNone ;
 
 
 UIPanGestureRecognizer *getture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pvt_pan:)];
 [self.view addGestureRecognizer:getture];
 
 
 [self.view addSubview:self.headerView];
 [self.view addSubview:self.scrollTabelView];
 
 
 [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
 self.headerCons = make.top.equalTo(self.view) ;
 make.left.and.right.equalTo(self.view) ;
 make.height.mas_equalTo(@120) ;
 }];
 
 [self.scrollTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
 make.top.equalTo(self.headerView.mas_bottom).offset(5) ;
 make.left.and.right.equalTo(self.view) ;
 make.bottom.equalTo(self.view).offset(-20) ;
 }];
 self.scrollTabelView.currentIndex = 1 ;
 
 
 }

-(void)pvt_pan:(UIPanGestureRecognizer*)panGestureRecognizer {

    NSLog(@"##########pvt_pan ###########") ;
 
 
    UIView *view = self.headerView;
    
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        // calculate accelerator
 
         CGPoint translation = [panGestureRecognizer translationInView:view.superview];
        
        CGRect frame = self.scrollTabelView.frame ;
        
        if (translation.y < 0) {
            if (CGRectGetMaxY(self.headerView.frame) > 0 ) {
                [view setCenter:(CGPoint){view.center.x, MAX(view.center.y + translation.y, -60)  }];
                _currentTableView.panGestureRecognizer.enabled = NO ;
            }else{
                _currentTableView.panGestureRecognizer.enabled = YES ;
            }
        }else{
        
            if (CGRectGetMinY(self.headerView.frame)< 0) {
                [view setCenter:(CGPoint){view.center.x, MIN(view.center.y + translation.y, 60)  }];
                _currentTableView.panGestureRecognizer.enabled = NO ;
 
            }else{
                _currentTableView.panGestureRecognizer.enabled = YES ;
            }
        }
        
        frame.origin.y = CGRectGetMaxY(view.frame) ;
        
        self.scrollTabelView.frame = CGRectMake(0, CGRectGetMaxY(view.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - CGRectGetMaxY(view.frame)) ;
        
//                if (CGRectGetMaxY(self.headerView.frame)> 0 && CGRectGetMaxY(self.headerView.frame)+translation.y < 40 ) {
//            [view setCenter:(CGPoint){view.center.x, view.center.y + translation.y }];
//         }
        [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
    }else{
    
        _currentTableView.panGestureRecognizer.enabled = YES ;

    }
//    else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
//        // bounce to original frame
//        CGRect newFrame = self.headerView.frame;
//        
//    }

    
    
}


#pragma mark- getter

-(UIView*)headerView{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]init];
        _headerView.backgroundColor = [UIColor blueColor] ;
    }
    
    return _headerView ;
}

-(DPScrollTableView*)scrollTabelView{

    if (_scrollTabelView == nil) {
        
        NSArray *items = @[@"全部",@"大支付",@"未完结",@"中奖"] ;
//        NSArray *items = @[@"全部"] ;

        _scrollTabelView = [[DPScrollTableView alloc]initWithItems:items];
        _scrollTabelView.itemTappedBlock = ^(NSInteger index){
        
//            NSLog(@"当前选中的位置  == ==  %zd",index) ;
            DPBaseView  *view = [self.scrollTabelView.tabsArray objectAtIndex:index] ;
          
            [view.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
//            view.tableView.panGestureRecognizer.enabled = NO ;
            _currentTableView = view.tableView ;
        } ;
        
         _scrollTabelView.backgroundColor = [UIColor grayColor] ;
    }
    
    return _scrollTabelView ;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"contentOffset"] ) {
         UITableView *view = (UITableView*)object ;
        
        
        CGFloat newOff = view.contentOffset.y ;
        CGFloat ddd = CGRectGetMinY(self.headerView.frame) ;
        
        NSLog(@"dragging = %d ,decelerating = %d ,tracking = %d",view.dragging,view.decelerating,view.tracking) ;
        
        if (view.contentOffset.y<= 0 && CGRectGetMaxY(self.headerView.frame) < 120) {
            view.panGestureRecognizer.enabled = NO ;
    
            [view setContentOffset:CGPointZero animated:YES];
 
        }if (view.contentOffset.y > 0 && view.panGestureRecognizer.enabled && CGRectGetMaxY(self.headerView.frame) > 0) {
            view.panGestureRecognizer.enabled = NO ;
            [view setContentOffset:CGPointZero animated:YES];
          }
        
        self.lastOffsetY = newOff ;
        
        
//        if (view.contentOffset.y < 40 && view.contentOffset.y >= 0) {
////            self.headerCons.mas_equalTo(- view.contentOffset.y) ;
//            [self layoutHeaderView:view.contentOffset.y];
//        }
        
    }
    
}


-(void)layoutHeaderView:(CGFloat) ofsset{

//    [self.headerView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_offset(-ofsset) ;
//        make.left.and.right.equalTo(self.view) ;
//        make.height.mas_equalTo(40) ;
//    }];
}

//- (UITableView *)generateTableViewWithTab:(NSInteger)tab {
//    UITableView *tableView = [[UITableView alloc] init];
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    tableView.backgroundColor = [UIColor grayColor];
//    tableView.separatorColor = [UIColor colorWithRed:0.78 green:0.78 blue:0.76 alpha:1];
//    tableView.scrollsToTop = YES;
//    tableView.tag = tab;
//    tableView.tableFooterView = [[UIView alloc] init];
//    
//    [tableView registerClass:[DPFirstIndexCell class] forCellReuseIdentifier:cellIdentify[tab]];
//    [tableView registerClass:[DPSecondIndexCell class] forCellReuseIdentifier:cellIdentify[tab]];
//    [tableView registerClass:[DPThirdIndexCell class] forCellReuseIdentifier:cellIdentify[tab]];
//    return tableView;
//}
*/

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
