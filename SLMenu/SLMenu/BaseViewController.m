//
//  BaseViewController.m
//  SLMenu
//
//  Created by Georgios Pessios on 10/01/16.
//  Copyright © 2016 Georgios Pessios. All rights reserved.
//

#import "BaseViewController.h"
#import "SLMenuViewController.h"

@interface BaseViewController() <SlideMenuProtocolDelegate>

@property(nonatomic, strong)SLMenuViewController *menuVC;
@property(nonatomic) BOOL isOpen;

@end

@implementation BaseViewController

-(void)addSlideMenuButton{
    
    
    UIButton *btnShowMenu = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnShowMenu setImage:[self defaultMenuImage] forState:UIControlStateNormal];
    btnShowMenu.frame = CGRectMake(0, 0, 30, 30);
    [btnShowMenu addTarget:self action:@selector(onSlideMenuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:btnShowMenu];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
}

-(void)addSlideMenuSwipeGesture{
    
    UISwipeGestureRecognizer *swipeMenuLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    UISwipeGestureRecognizer *swipeMenuRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    swipeMenuLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeMenuRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeMenuLeft];
    [self.view addGestureRecognizer:swipeMenuRight];
    
}


-(UIImage *)defaultMenuImage{
    
    __block UIImage *defaultMenuImage = [[UIImage alloc] init];
    
    static dispatch_once_t p = 0;
    
    dispatch_once(&p, ^{
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(30, 22), false, 0.0);
        
        [[UIColor blackColor] setFill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 3, 30, 1)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 10, 30, 1)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 17, 30, 1)] fill];
        
        [[UIColor whiteColor] setFill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 4, 30, 1)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 11, 30, 1)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 18, 30, 1)] fill];
        
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
    });
    
    
    return defaultMenuImage;
    
}

-(void)slideMenuItemSelectedAtIndex: (NSUInteger)index{
    
}

-(IBAction)handleSwipeGesture:(UISwipeGestureRecognizer *)recognizer{
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        if (recognizer){
            self.isOpen = false;
            [self slideMenuItemSelectedAtIndex:-1];
            self.menuVC.btnMenu.tag = 0;
            UIView *viewMenuBack = [[UIView alloc] init];
            viewMenuBack = self.view.subviews.lastObject;
            
            [UIView animateWithDuration:0.3 animations:^{
                
                CGRect frameMenu = viewMenuBack.frame;
                frameMenu.origin.x = -[UIScreen mainScreen].bounds.size.width;
                viewMenuBack.frame = frameMenu;
                [viewMenuBack layoutIfNeeded];
                viewMenuBack.backgroundColor = [UIColor clearColor];
                
                
            } completion:^(BOOL finished) {
                
                [viewMenuBack removeFromSuperview];
                
            }];
            return;
        }
        
        
        
    }else if(self.isOpen == false){
        self.isOpen = true;
        self.menuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SLMenuViewController"];
        self.menuVC.delegate = self;
        [self.view addSubview:self.menuVC.view];
        [self.menuVC.view setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0.1]];
        [self addChildViewController:self.menuVC];
        [self.menuVC.view layoutIfNeeded];
        self.menuVC.view.frame = CGRectMake(-[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.menuVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            
            
        } completion:^(BOOL finished) {
            
            self.menuVC.btnMenu.enabled = true;
            
        }];
    }
    
    
}

-(IBAction)onSlideMenuButtonPressed:(UIButton *)sender{
    
    if (self.isOpen == true){
        self.isOpen = false;
        UIView *viewMenuBack = [[UIView alloc] init];
        viewMenuBack = self.view.subviews.lastObject;
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect frameMenu = viewMenuBack.frame;
            frameMenu.origin.x = -[UIScreen mainScreen].bounds.size.width;
            viewMenuBack.frame = frameMenu;
            [viewMenuBack layoutIfNeeded];
            viewMenuBack.backgroundColor = [UIColor clearColor];
            
            
        } completion:^(BOOL finished) {
            
            [viewMenuBack removeFromSuperview];
            
        }];
        return;
    }else{
    
        self.isOpen= true;
        self.menuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SLMenuViewController"];
        self.menuVC.btnMenu = sender;
        self.menuVC.delegate = self;
        [self.view addSubview:self.menuVC.view];
        [self.menuVC.view setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0.1]];
        [self addChildViewController:self.menuVC];
        [self.menuVC.view layoutIfNeeded];
        self.menuVC.view.frame = CGRectMake(-[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.menuVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            
            
        } completion:^(BOOL finished) {
            
            sender.enabled = true;
            
        }];
    
    
    }
    
    
    
}




@end
