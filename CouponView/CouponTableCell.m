//
//  CouponTableCell.m
//  DiidyProject
//
//  Created by diidy on 12-8-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CouponTableCell.h"

@implementation CouponTableCell
@synthesize nameLable,closeDataLable,presentationLable,numberLable;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setSelectionStyle:UITableViewCellEditingStyleNone];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"u0_normal.png"]];
        
        presentationLable = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 100, 60)];
        presentationLable.backgroundColor = [UIColor clearColor];
        presentationLable.text = @"赠送给朋友 >>";
        presentationLable.font = [UIFont fontWithName:@"Arial" size:14];
        [self.contentView addSubview:presentationLable];
        
        nameLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 30)];
        nameLable.backgroundColor = [UIColor clearColor];
        nameLable.font = [UIFont fontWithName:@"Arial" size:14];
        [self.contentView addSubview:nameLable];
        
        numberLable = [[UILabel alloc] initWithFrame:CGRectMake(115, 0, 60, 30)];
        numberLable.backgroundColor = [UIColor clearColor];
        numberLable.font = [UIFont fontWithName:@"Arial" size:14];
        [self.contentView addSubview:numberLable];
        
        
        closeDataLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 140, 30)];
        closeDataLable.backgroundColor = [UIColor clearColor];
        closeDataLable.font = [UIFont fontWithName:@"Arial" size:14];
        [self.contentView addSubview:closeDataLable];
        
        UIImageView * lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"u49_line.png"]];
        lineImageView.frame = CGRectMake(0, 57, 320, 3);
        [self.contentView addSubview:lineImageView];

        
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)dealloc
{
    [numberLable release];
    [nameLable release];
    [closeDataLable release];
    [presentationLable release];
    [super dealloc];

}
@end