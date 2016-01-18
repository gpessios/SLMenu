//
//  SLMenuViewController.m
//  SLMenu
//
//  Created by Georgios Pessios on 10/01/16.
//  Copyright © 2016 Georgios Pessios. All rights reserved.
//

#import "SLMenuViewController.h"

@implementation SLMenuViewController


-(IBAction)onCloseMenuClick:(UIButton *)button{
    self.btnMenu.tag = 0;
    
    if (self.delegate != nil){
        
        NSUInteger index = button.tag;
        if (button == self.btnCloseMenuOverlay){
            
            index = -1;
            
        }
        
        [self.delegate slideMenuItemSelectedAtIndex:index];
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(-[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        [self.view layoutIfNeeded];
        self.view.backgroundColor = [UIColor clearColor];
        
    } completion:^(BOOL finished) {
        
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
        
    }];
}
@end
