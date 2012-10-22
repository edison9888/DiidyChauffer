//
//  SelectCouponViewController.m
//  DiidyProject
//
//  Created by diidy on 12-9-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SelectCouponViewController.h"
#import "DIIdyModel.h"
#import "OrdersPreviewViewController.h"
#import "OrdersPreviewTwoViewController.h"
@interface SelectCouponViewController ()

@end

@implementation SelectCouponViewController
@synthesize selectCouponAray,rowNumber;
@synthesize delegate,mark,orderPreArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark-TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [selectCouponAray count];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    DIIdyModel * diidyModel = [selectCouponAray objectAtIndex:section];
    return [diidyModel.number intValue];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell ==nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
        cell.backgroundColor =[UIColor whiteColor];
        
        UILabel * nameLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 270,22 )];
        nameLable.numberOfLines = 0;
        // nameLable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"u0_normal.png"]];
        nameLable.backgroundColor = [UIColor clearColor];
        nameLable.font = [UIFont fontWithName:@"Arial" size:14];
        nameLable.textColor = [UIColor orangeColor];
        nameLable.tag = 81;
        [cell.contentView addSubview:nameLable];
        [nameLable release];
        
        UILabel * timeLable = [[UILabel alloc] initWithFrame:CGRectMake(10,22, 270,22)];
        timeLable.numberOfLines = 0;
        //addressLable.backgroundColor =  [UIColor colorWithPatternImage:[UIImage imageNamed:@"u0_normal.png"]];
        timeLable.backgroundColor = [UIColor clearColor];
        timeLable.font = [UIFont fontWithName:@"Arial" size:12];
        timeLable.textColor = [UIColor orangeColor];
        timeLable.tag = 82;
        [cell.contentView addSubview:timeLable];
        [timeLable release];
       // cell.contentView.backgroundColor = [UIColor orangeColor];

    }
    
    DIIdyModel * diidyMbdel = [selectCouponAray objectAtIndex:indexPath.section];
    UILabel *nameLable = (UILabel*)[cell.contentView viewWithTag:81];
    nameLable.text = diidyMbdel.name;
    
    UILabel*timeLable = (UILabel*)[cell.contentView viewWithTag:82];
    timeLable.text = diidyMbdel.close_date;
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if ([useSelectCouponArray count]>=number) {
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"提示" 
                                                       message:@"您选择的优惠劵数量超出了司机数量"
                                                      delegate:nil
                                             cancelButtonTitle:@"取消" 
                                             otherButtonTitles:nil ];
        [alert show];
        [alert release];
    }else {
        NSIndexPath *willDeleteIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
        [useSelectCouponArray addObject:willDeleteIndexPath];

    }
   
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    for (NSIndexPath *ip in useSelectCouponArray) {
        if (ip.section == indexPath.section && ip.row == indexPath.row) {
            [useSelectCouponArray removeObject:ip];
            break;
        }
    }
}
#pragma mark-Buton
-(void)returnFillOrderView:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)skipCouponView:(id)sender
{
    OrdersPreviewTwoViewController * order = [[OrdersPreviewTwoViewController alloc] init];
    order.orderArray =  self.orderPreArray;
    
    [self.navigationController pushViewController:order animated:YES];
    [order release];
}
-(void)nextStep:(id)sender
{
    if(!self.mark){
        [delegate selectedCoupon:useSelectCouponArray];
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        OrdersPreviewViewController * order = [[OrdersPreviewViewController alloc] init];
        order.orderArray = self.orderPreArray;
        order.useCouponArray=useSelectCouponArray;
        order.selectArray = selectCouponAray;
        [self.navigationController pushViewController:order animated:YES];
        [order release];
    }
    
}
#pragma mark - System Approach
- (void)viewDidLoad
{
    [super viewDidLoad];
  //  self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2.png"]];
    self.view.backgroundColor= [UIColor darkGrayColor];
    self.navigationItem.hidesBackButton = YES;
    
    useSelectCouponArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    topImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg-1.png"]];
    topImageView.frame = CGRectMake(0.0, -2.0, 320.0, 49.0);
    [self.navigationController.navigationBar addSubview:topImageView];
    
    returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:13.0f];
    returnButton.frame=CGRectMake(7.0, 7.0, 50.0, 30.0);
    [returnButton setTitle:@"返回" forState:UIControlStateNormal];
    [returnButton setBackgroundImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnFillOrderView:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:returnButton];
    
    centerLable = [[UILabel alloc] initWithFrame:CGRectMake(80.0f, 0.0f, 160.0f, 44.0f)];
    centerLable.font = [UIFont systemFontOfSize:17];
    centerLable.textColor = [UIColor whiteColor];
    centerLable.backgroundColor = [UIColor clearColor];
    centerLable.textAlignment = NSTextAlignmentCenter;
    centerLable.text = @"选 择 优 惠 劵";
    [self.navigationController.navigationBar addSubview:centerLable];
     
    NSString * title;
    UIImage*nextd;
    if(self.mark){
        title = @"";
        nextd = [UIImage imageNamed:@"button4.png"];
        
    }else {
        title = @"完成";
        nextd = [UIImage imageNamed:@"33.png"];
    }
    
    rigthbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rigthbutton setBackgroundImage:nextd forState:UIControlStateNormal];
    [rigthbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rigthbutton setTitle:title forState:UIControlStateNormal];
    rigthbutton.titleLabel.font = [UIFont fontWithName:@"Arial" size:13.0f];
    rigthbutton.frame=CGRectMake(260.0f, 7.0f, 50.0f, 30.0f);
    [rigthbutton setTitle:@"完成" forState:UIControlStateNormal];
    [rigthbutton addTarget:self action:@selector(nextStep:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:rigthbutton];
    
//    UILabel *promptLable = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 303.0f, 50.0f)];
//    promptLable.font = [UIFont systemFontOfSize:14];
//    promptLable.textColor = [UIColor blackColor];
//    promptLable.backgroundColor = [UIColor clearColor];
//    promptLable.textAlignment = NSTextAlignmentCenter;
//    promptLable.text = @"选 择 优 惠 劵";
//    
//    UIImage * promptImage = [UIImage imageNamed:@"u689_normal.png"];
//    UIImageView * promptImageView = [[UIImageView alloc] initWithImage:promptImage];
//    promptImageView.frame = CGRectMake(8.0f, 0.0f, promptImage.size.width, promptImage.size.height);
//    [promptImageView addSubview:promptLable];
//    [self.view addSubview:promptImageView];
//    [promptImageView release];
//    [promptLable release];
    
    CGRect  rect ;
    if((140.f+self.rowNumber*44.0f)>416.0f){
        rect =self.view.bounds;
        
    }else {
        rect = CGRectMake(0.0f, 0.0f, 320.0f, 134.0f+(rowNumber-2)*44.0f);
    }
    
    
    UITableView * orderTableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    [orderTableView setEditing:YES animated:YES];
    orderTableView.separatorColor = [UIColor grayColor];
    orderTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
   // orderTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2.png"]];
    orderTableView.backgroundColor = [UIColor darkGrayColor];
    orderTableView.delegate = self;
    orderTableView.dataSource = self;
    [orderTableView setSeparatorColor:[UIColor blackColor]];
    [self.view addSubview:orderTableView];
    [orderTableView release];
    
//    UIImage * skipImage = [UIImage imageNamed:@"u663_normal.png"];
//    UIButton *skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    skipButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:13.0f];
//    skipButton.frame=CGRectMake(5.0, 376.0, skipImage.size.width, skipImage.size.height);
//    [skipButton setBackgroundImage:skipImage forState:UIControlStateNormal];
//    [skipButton setTitle:@"跳过,本次订单不适用优惠劵" forState:UIControlStateNormal];
//    [skipButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [skipButton addTarget:self action:@selector(skipCouponView:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:skipButton];
    
    NSString * peopleNumber = [self.orderPreArray  objectAtIndex:2];
    NSArray *peopleArr = [peopleNumber componentsSeparatedByString:@"人"];
    NSString * peNumber = [peopleArr objectAtIndex:0];
    number = [peNumber intValue];
}
-(void)viewDidDisappear:(BOOL)animated
{
    topImageView.hidden = YES;
    returnButton.hidden = YES;
    rigthbutton.hidden = YES;
    centerLable.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    topImageView.hidden = NO;
    returnButton.hidden = NO;
    rigthbutton.hidden = NO;
    centerLable.hidden = NO;

}
-(void)dealloc
{
    [centerLable release];
    [orderPreArray release];
    [selectCouponAray release];
    [topImageView release];
    [useSelectCouponArray release];
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
