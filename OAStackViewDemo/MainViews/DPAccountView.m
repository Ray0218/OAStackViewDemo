//
//  DPAccountView.m
//  OAStackViewDemo
//
//  Created by Ray on 15/12/28.
//  Copyright © 2015年 Ray. All rights reserved.
//

#import "DPAccountView.h"

#define labelTag 10000
#define kScreenWidth  CGRectGetWidth([[UIScreen mainScreen]bounds])

#define kSpace  1

@interface DPAccountView ()

@end

@implementation DPAccountView

- (instancetype)initWithWidthArray:(NSArray *)widthArray whithHigh:(CGFloat)hight backColor:(UIColor*)color
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor] ;
        
        float leftwidth = 0;
        for (int i = 0; i < widthArray.count; i++) {
            UILabel *lab = [self createLabelWithColor:color];
            lab.tag = labelTag + i;
            [self addSubview:lab];
            
            float widthLab = [[widthArray objectAtIndex:i] floatValue] *(kScreenWidth/320.0);
 
            
            if (i<widthArray.count-1) {
                [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self);
                    make.left.equalTo(@(leftwidth));
                    make.bottom.equalTo(self);
                    make.width.equalTo(@(widthLab));
                    
                }];
                leftwidth += widthLab+kSpace;

            }else{
            
                [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self);
                    make.left.equalTo(@(leftwidth));
                    make.bottom.equalTo(self);
                    make.right.equalTo(self);
                    
                }];
            
            }
            
            
            
        }

    }
    return self;
}

-(void)changeTextColorWithIndex:(NSInteger)index color:(UIColor*)color {
    UILabel *lab = [self viewWithTag:labelTag+index] ;
    lab.textColor = color ;
}


- (void)setTitles:(NSArray *)titleArray {
    for (int i = 0; i < titleArray.count; i++) {
        UILabel *lab = (UILabel *)[self viewWithTag:labelTag + i];
        id text = [titleArray objectAtIndex:i];
        if ([text isKindOfClass:[NSString class]]) {
            lab.text = text;
        } else {
            lab.attributedText = text;
        }
     }
}

- (UILabel *)createLabelWithColor:(UIColor*) color {
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = color;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:13] ;
    label.textColor = [UIColor blackColor] ;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
     return label;
}

@end
