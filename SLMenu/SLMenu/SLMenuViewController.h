//
//  SLMenuViewController.h
//  SLMenu
//
//  Created by Georgios Pessios on 10/01/16.
//  Copyright © 2016 Georgios Pessios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideMenuProtocolDelegate <NSObject>

@required

-(void)slideMenuItemSelectedAtIndex: (NSUInteger)index;

@end

@interface SLMenuViewController : UIViewController

@property (weak, nonatomic)id<SlideMenuProtocolDelegate> delegate;
@property (nonatomic, strong)IBOutlet UIButton *btnCloseMenuOverlay;
@property (nonatomic, strong)UIButton *btnMenu;

@end
