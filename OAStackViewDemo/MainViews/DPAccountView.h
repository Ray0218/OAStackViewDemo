//
//  DPAccountView.h
//  OAStackViewDemo
//
//  Created by Ray on 15/12/28.
//  Copyright © 2015年 Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPAccountView : UIView


- (instancetype)initWithWidthArray:(NSArray *)widthArray whithHigh:(CGFloat)hight backColor:(UIColor*)color ;

-(void)setTitles:(NSArray*)titleArray;

-(void)changeTextColorWithIndex:(NSInteger)index color:(UIColor*)color ;

@end
