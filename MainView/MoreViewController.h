//
//  MoreViewController.h
//  DiidyProject
//
//  Created by diidy on 12-8-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    NSArray * moreNameArray;
    
    UIImageView*topImageView;
    UIButton*returnButton;
    UILabel *centerLable;
}
@property(nonatomic,retain)NSArray *moreNameArray;
@property(nonatomic,retain)NSString*whereLand;
@end
