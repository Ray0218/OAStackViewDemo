//
//  DPScrollTableView.m
//  OAStackViewDemo
//
//  Created by Ray on 15/12/25.
//  Copyright © 2015年 Ray. All rights reserved.
//

#import "DPScrollTableView.h"
#import "DPFirstView.h"
#import "DPSecondView.h"
#import "DPThirdView.h"
#import "DPFourthView.h"
#import "DPFiveView.h"


@interface DPScrollTableView ()<UIScrollViewDelegate>

@end


static NSInteger indirectorWidth = 0;

@implementation DPScrollTableView

- (instancetype)initWithItems:(NSArray*)items
{
    self = [super init];
    if (self) {
        indirectorWidth =   [[UIScreen mainScreen]bounds].size.width/items.count ;
        
        self.topBtnBackView = [[UIView alloc]init];
        [self addSubview:self.topBtnBackView];
        [self.topBtnBackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(-1);
            make.left.mas_equalTo(-1);
            make.right.mas_equalTo(1);
            self.btnViewHeight = make.height.mas_equalTo(37.5);
        }];
        
        
        UIView *btnsBottomLine = [[UIView alloc]init];
        btnsBottomLine.backgroundColor = [UIColor blueColor];
        [self.topBtnBackView addSubview:btnsBottomLine];
        [btnsBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
        
        UIView *btnsUpLine = [[UIView alloc]init];
        btnsUpLine.backgroundColor = [UIColor orangeColor];
        [self.topBtnBackView addSubview:btnsUpLine];
        [btnsUpLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
        
        self.indicatorView = [[UIView alloc]init];
        self.indicatorView.backgroundColor = [UIColor redColor];
        [self addSubview:self.indicatorView];
        [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.topBtnBackView.mas_bottom);
            make.width.mas_equalTo(indirectorWidth);
            make.height.mas_equalTo(3);
            make.centerX.mas_equalTo(0);
        }];
        
        
        
        self.tabContentView.contentSize = CGSizeMake(CGRectGetWidth([[UIScreen mainScreen]bounds])*items.count, 0);
        [self addSubview:self.tabContentView];
        [self.tabContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topBtnBackView.mas_bottom);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        
        NSArray *colors = @[[UIColor greenColor],[UIColor purpleColor],[UIColor brownColor], [UIColor cyanColor],[UIColor magentaColor]] ;
        self.tableViewsArray = [NSMutableArray array];
        UIView *contentView = [[UIView alloc]init];
         [self.tabContentView addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tabContentView.mas_top);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(self.tabContentView.mas_height);
            make.width.mas_equalTo(CGRectGetWidth([[UIScreen mainScreen]bounds])*items.count);
            make.centerY.mas_equalTo(self.tabContentView.mas_centerY);
        }];
        
        CGFloat btnW = CGRectGetWidth([[UIScreen mainScreen]bounds])/items.count;
        for (NSInteger i = 0; i < items.count; i++) {
            //选择按钮
            UIButton *btn = [[UIButton alloc]init];
            btn.tag = 100+i;
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            [btn setTitle:items[i] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(pvt_clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.topBtnBackView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(0);
                make.left.mas_equalTo(btnW*i);
                make.bottom.mas_equalTo(0);
                make.width.mas_equalTo(btnW);
            }];
            
            
            
            UIView *tableView = self.tabsArray[i];
            tableView.backgroundColor = colors[i];
            [contentView addSubview:tableView];
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(0);
                make.left.mas_equalTo(CGRectGetWidth([[UIScreen mainScreen]bounds]) * i);
                make.bottom.mas_equalTo(0);
                make.width.mas_equalTo(CGRectGetWidth([[UIScreen mainScreen]bounds]));
            }];
            [self.tableViewsArray addObject:tableView];
        }

    }
    return self;
}


-(NSArray *)tabsArray {

    if (_tabsArray == nil ) {
        
        DPBaseView *view1 = [[DPFiveView alloc]init];
        
     _tabsArray = @[ [[DPFirstView alloc]init],[[DPSecondView alloc]init] ,[[DPThirdView alloc]init],[[DPFourthView alloc]init],[[DPFiveView alloc]init] ];
    }
    

    return _tabsArray ;
}



//- (instancetype)initWithFrame:(CGRect)frame andItems:(NSArray *)items{
//    self  = [super initWithFrame:frame];
//    if (self) {
//        
//        indirectorWidth =   [[UIScreen mainScreen]bounds].size.width/items.count ;
//       
//        self.topBtnBackView = [[UIView alloc]init];
//        [self addSubview:self.topBtnBackView];
//        [self.topBtnBackView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(-1);
//            make.left.mas_equalTo(-1);
//            make.right.mas_equalTo(1);
//            self.btnViewHeight = make.height.mas_equalTo(37.5);
//        }];
//        
//        
//        UIView *btnsBottomLine = [[UIView alloc]init];
//        btnsBottomLine.backgroundColor = [UIColor blueColor];
//        [self.topBtnBackView addSubview:btnsBottomLine];
//        [btnsBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(0);
//            make.left.mas_equalTo(0);
//            make.right.mas_equalTo(0);
//            make.height.mas_equalTo(0.5);
//        }];
//        
//        UIView *btnsUpLine = [[UIView alloc]init];
//        btnsUpLine.backgroundColor = [UIColor orangeColor];
//        [self.topBtnBackView addSubview:btnsUpLine];
//        [btnsUpLine mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(0);
//            make.left.mas_equalTo(0);
//            make.right.mas_equalTo(0);
//            make.height.mas_equalTo(0.5);
//        }];
//        
//         self.indicatorView = [[UIView alloc]init];
//        self.indicatorView.backgroundColor = [UIColor redColor];
//        [self addSubview:self.indicatorView];
//        [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(self.topBtnBackView.mas_bottom);
//            make.width.mas_equalTo(indirectorWidth);
//            make.height.mas_equalTo(3);
//            make.centerX.mas_equalTo(0);
//        }];
//        
//        
//        
//        self.tabContentView.contentSize = CGSizeMake(CGRectGetWidth([[UIScreen mainScreen]bounds])*items.count, 0);
//        [self addSubview:self.tabContentView];
//        [self.tabContentView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.topBtnBackView.mas_bottom);
//            make.left.mas_equalTo(0);
//            make.right.mas_equalTo(0);
//            make.bottom.mas_equalTo(0);
//        }];
//        self.tableViewsArray = [NSMutableArray array];
//        UIView *contentView = [[UIView alloc]init];
//        contentView.backgroundColor = [UIColor clearColor];
//        [self.tabContentView addSubview:contentView];
//        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.tabContentView.mas_top);
//            make.left.mas_equalTo(0);
//            make.right.mas_equalTo(0);
//            make.height.mas_equalTo(self.tabContentView.mas_height);
//            make.width.mas_equalTo(CGRectGetWidth([[UIScreen mainScreen]bounds])*items.count);
//            make.centerY.mas_equalTo(self.tabContentView.mas_centerY);
//        }];
//        
//        CGFloat btnW = CGRectGetWidth([[UIScreen mainScreen]bounds])/items.count;
//        for (NSInteger i = 0; i < items.count; i++) {
//            //选择按钮
//            UIButton *btn = [[UIButton alloc]init];
//            btn.tag = 100+i;
//            btn.titleLabel.font = [UIFont systemFontOfSize:14];
//            [btn setTitle:items[i] forState:UIControlStateNormal];
//            [btn addTarget:self action:@selector(pvt_clickBtn:) forControlEvents:UIControlEventTouchUpInside];
//            [self.topBtnBackView addSubview:btn];
//            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(0);
//                make.left.mas_equalTo(btnW*i);
//                make.bottom.mas_equalTo(0);
//                make.width.mas_equalTo(btnW);
//            }];
//             
//            UIView *tableView = [[UIView alloc]init];
//            tableView.backgroundColor = [UIColor clearColor];
//            [contentView addSubview:tableView];
//            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(0);
//                make.left.mas_equalTo(CGRectGetWidth([[UIScreen mainScreen]bounds]) * i);
//                make.bottom.mas_equalTo(0);
//                make.width.mas_equalTo(CGRectGetWidth([[UIScreen mainScreen]bounds]));
//            }];
//            [self.tableViewsArray addObject:tableView];
//        }
//    }
//    return self;
//}

#pragma mark---------tablesView
- (UIScrollView *)tabContentView{
    if (!_tabContentView) {
        _tabContentView = [[UIScrollView alloc]init];
        _tabContentView.showsHorizontalScrollIndicator = NO ;
        _tabContentView.delegate = self;
        _tabContentView.pagingEnabled = YES;
    }
    return _tabContentView;
}
 

#pragma mark- scrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger tag = scrollView.contentOffset.x/CGRectGetWidth([[UIScreen mainScreen] bounds]);

    self.currentIndex = tag ;
}

#pragma mark---------function

 
-(void)setCurrentIndex:(NSInteger)currentIndex{

//    if(_currentIndex == currentIndex)return ;
    
    _currentIndex = currentIndex ;
    
    [self.tabContentView setContentOffset:CGPointMake(CGRectGetWidth([[UIScreen mainScreen] bounds])*currentIndex, 0)];

    UIButton *btn= (UIButton *)[self.topBtnBackView viewWithTag:100+currentIndex];
    if (self.itemTappedBlock) {
        self.itemTappedBlock(currentIndex);
    }
    if (btn.selected == NO) {
        self.currentBtn = btn;
        btn.selected = !btn.selected;
        self.lastBtn.selected = !btn.selected;
        self.lastBtn = btn;
    }
    
    [self.indicatorView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn.mas_centerX);
        make.bottom.equalTo(self.topBtnBackView.mas_bottom);
        make.width.mas_equalTo(indirectorWidth);
        make.height.mas_equalTo(3);
    }];
    

    
}

- (void)pvt_clickBtn:(UIButton *)btn{
    
    NSInteger index = btn.tag - 100 ;
    
    self.currentIndex = index ;
}



@end











