//
//  NotLoggedViewController.m
//  DiidyProject
//
//  Created by diidy on 12-9-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NotLoggedViewController.h"
#import "FeedBackViewController.h"
#import "AboutDiiDyViewController.h"
#import "CONST.h"
#import "NoviceGuidanceViewController.h"
#import "LandingViewController.h"
#import "AppDelegate.h"
@interface NotLoggedViewController ()

@end

@implementation NotLoggedViewController
@synthesize  moreNameArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell ==nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
        cell.backgroundColor = [UIColor whiteColor];
       
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.textColor = [UIColor colorWithRed:79.0/255.0 green:79.0/255.0 blue:79.0/255.0 alpha:1];
    cell.textLabel.text = [moreNameArray objectAtIndex:indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        
        FeedBackViewController * feedBack = [[FeedBackViewController alloc] init];
        feedBack.judge = @"notLog";
        [self.navigationController pushViewController:feedBack animated:YES];
        [feedBack release];
        
    }else if(indexPath.row ==1){
        
        AboutDiiDyViewController * aboutDiidy = [[AboutDiiDyViewController alloc] initWithNibName:@"AboutDiiDyViewController" bundle:nil];
        [self.navigationController pushViewController:aboutDiidy animated:YES];
        [aboutDiidy release];
        
    }else {
        
        NoviceGuidanceViewController * noviceGudice= [[NoviceGuidanceViewController alloc] init];
        noviceGudice.noviceGuidan = @"novice";
       // [self.navigationController pushViewController:noviceGudice animated:YES];
        [self presentModalViewController:noviceGudice animated:NO];
        [noviceGudice release];

    }
}
-(void)returnORLandingView:(UIButton*)sender
{
       if (sender.tag ==201) {
           
            [self dismissModalViewControllerAnimated:NO];
           
        }else {
            
            LandingViewController * land = [[LandingViewController alloc] init];
            UINavigationController * landNa = [[UINavigationController alloc] initWithRootViewController:land];
            ShareApp.pageManageMent = @"notLog";
            [self presentModalViewController:landNa animated:NO];
            [landNa release];
            [land release];

        }
        
}
-(void)onRequestCompelte:(NSNotification *)notification
{
    NSDictionary *dict = notification.userInfo;
    NSString * returnNews = [dict objectForKey:@"return"];
    if ([returnNews isEqualToString:@"s"]) {
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:nil 
                                                       message:@"提交成功！我们会认真参考您的建议,非常感谢！"
                                                      delegate:nil 
                                             cancelButtonTitle:@"确认" 
                                             otherButtonTitles:nil ];
        [alert show];
        [alert release];
    }else {
        
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:nil 
                                                       message:@"可能由于网络原因没有成功提交。您也可以拨打4006960666进行反馈。"
                                                      delegate:nil 
                                             cancelButtonTitle:@"确认" 
                                             otherButtonTitles:nil ];
        [alert show];
        [alert release];
    }

}

#pragma mark - System Approach
-(void)creatNavigationBar
{
    
    rigthbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    rigthbutton.frame=CGRectMake(260.0f, 7.0f, 50.0f, 30.0f);
    rigthbutton.tag = 200;
    rigthbutton.titleLabel.font = [UIFont fontWithName:@"Arial" size:13.0f];
    [rigthbutton setTitle:@"登录" forState:UIControlStateNormal];
    [rigthbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rigthbutton setBackgroundImage:[UIImage imageNamed:@"33.png"] forState:UIControlStateNormal];
    [rigthbutton addTarget:self action:@selector(returnORLandingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:rigthbutton];
    
    centerLable = [[UILabel alloc] initWithFrame:CGRectMake(80.0f, 0.0f, 160.0f, 44.0f)];
    centerLable.text = @"更 多";
    centerLable.textColor = [UIColor whiteColor];
    centerLable.backgroundColor = [UIColor clearColor];
    centerLable.textAlignment = NSTextAlignmentCenter;
    centerLable.font = [UIFont fontWithName:@"Arial" size:18.0f];
    [self.navigationController.navigationBar addSubview:centerLable];
    
    returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:13.0f];
    returnButton.tag = 201;
    returnButton.frame=CGRectMake(7.0f,7.0f,50.0f,30.0f);
    [returnButton setTitle:@" 返回" forState:UIControlStateNormal];

    [returnButton setBackgroundImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnORLandingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:returnButton];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2.png"]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onRequestCompelte:) name:REQUEST_COMPLETE object:nil];
    self.moreNameArray = [NSArray  arrayWithObjects:@"意见反馈",@"关于嘀嘀",@"新手引导", nil];
    
    topImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg-1.png"]];
    topImageView.frame = CGRectMake(0.0f, -2.0f, 320.0f, 49.0f);
    [self.navigationController.navigationBar addSubview:topImageView];
    
    [self creatNavigationBar];    
    
    UITableView * moreTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    moreTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2.png"]];
    moreTableView.backgroundView = nil;
    moreTableView.separatorColor = [UIColor colorWithRed:182.0/255.0 green:182.0/255.0 blue:182.0/255.0 alpha:1];
    moreTableView.delegate = self;
    moreTableView.dataSource = self;
    [self.view addSubview:moreTableView];
    [moreTableView release];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    topImageView.hidden = YES;
    centerLable.hidden = YES;
    returnButton.hidden = YES;
    rigthbutton.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    topImageView.hidden = NO;
    centerLable.hidden = NO;
    returnButton.hidden = NO;
    rigthbutton.hidden = NO;
    

}
-(void)dealloc{

    [centerLable release];
    [moreNameArray release];
    [topImageView release];
    [super dealloc];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
