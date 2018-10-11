//

//
//  Created by Karthik  on 02/10/18.
//  Copyright © 2016 Karthik . All rights reserved.
//
#define NormalAnimation(_inView,_duration,_frames)            [UIView transitionWithView:_inView duration:_duration options:UIViewAnimationOptionTransitionNone animations:^{ _frames    }
#define SCREEN_HEIGHT                    [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH                    [UIScreen mainScreen].bounds.size.width
#define RGB(_red,_green,_blue)  [UIColor colorWithRed:_red/255.0 green:_green/255.0 blue:_blue/255.0 alpha:1]

#import "SPopup.h"

@interface SPopup ()<UITableViewDelegate,UITableViewDataSource>
{
    AppDelegate *appDelegate;
    
    NSArray *orderProcessingarrya;
    
    UIView * AlertPopUpView;
}
@end
@implementation SPopup
- (id)initWithFrame:(CGRect)frame delegate:(id<PopupDelegate>)delegate
{
    self = [super init];
    if ((self = [super initWithFrame:frame]))
    {
        self.TableProcessingDelegate = delegate;
    }
    
    return self;
}

-(void)RemoveViewProcess{
 
    NormalAnimation(AlertPopUpView, 0.50f,
                    
                    CGRect popFrame=self->AlertPopUpView.frame;
                    popFrame.origin.y=SCREEN_HEIGHT;
                    
                    self->AlertPopUpView.frame=popFrame;
                    

    
                )
completion:^(BOOL finished){
    [self removeFromSuperview];
    [self.TableProcessingDelegate CancelView];
  
  
}];
}



-(void)ProcessingMethod:(NSArray *)Titlearray Title:(NSString *)TitileStr;
{
    
      appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    [self addTarget:self action:@selector(RemoveViewProcess) forControlEvents:UIControlEventTouchUpInside];
    
    
    
     AlertPopUpView =[[UIView alloc]init];
     AlertPopUpView.frame = CGRectMake(self.frame.size.width/2-(self.frame.size.width/1.3)/2,self.frame.size.height/2-(self.frame.size.height/2.8)/2,self.frame.size.width/1.3,self.frame.size.height/2.8);
    AlertPopUpView.backgroundColor=[UIColor whiteColor];
    AlertPopUpView.layer.cornerRadius=10;
    AlertPopUpView.clipsToBounds=YES;
    [self addSubview:AlertPopUpView];
    

    
    UILabel *Orderlbl =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, AlertPopUpView.frame.size.width/1.2, AlertPopUpView.frame.size.height/5)];
    Orderlbl.backgroundColor=[UIColor blackColor];
    Orderlbl.textColor=[UIColor whiteColor];
    Orderlbl.font=[UIFont fontWithName:@"Helvetica" size:16];
    Orderlbl.text=[NSString stringWithFormat:@"  %@",TitileStr];
    [AlertPopUpView addSubview:Orderlbl];
    
    
    UIButton *Cancelbtn =[[UIButton alloc]initWithFrame:CGRectMake(Orderlbl.frame.origin.x+Orderlbl.frame.size.width,Orderlbl.frame.origin.y,AlertPopUpView.frame.size.width-Orderlbl.frame.size.width, AlertPopUpView.frame.size.height/5)];
    //    Cancelbtn.backgroundColor=RGB(50, 53, 58);
    Cancelbtn.backgroundColor=[UIColor blackColor];
    [Cancelbtn addTarget:self action:@selector(CancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [Cancelbtn setTitle:@"Cancel" forState:UIControlStateNormal];
    Cancelbtn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:14];
    [AlertPopUpView addSubview:Cancelbtn];
    
    
    
    UITableView *DropdownTable=[[UITableView alloc]initWithFrame:CGRectMake(0,Orderlbl.frame.origin.y+Orderlbl.frame.size.height,AlertPopUpView.frame.size.width,AlertPopUpView.frame.size.height-Orderlbl.frame.size.height)];
    DropdownTable.backgroundColor=[UIColor groupTableViewBackgroundColor];
    DropdownTable.dataSource=self;
    DropdownTable.delegate=self;
    DropdownTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [AlertPopUpView addSubview:DropdownTable];

 

    orderProcessingarrya =[[NSArray alloc]initWithArray:Titlearray];
    
    
}

-(void)CancelAction:(id)sender{
    
    NormalAnimation(AlertPopUpView, 0.50f,
                                    
                                    CGRect popFrame=self->AlertPopUpView.frame;
                                    popFrame.origin.y=SCREEN_HEIGHT;
                                    
                                    self->AlertPopUpView.frame=popFrame;
                                    

                    
                    )
completion:^(BOOL finished)
    {
    [self removeFromSuperview];
    [self.TableProcessingDelegate CancelView];
    
    
}];
 
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.frame.size.height/18;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [orderProcessingarrya count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.backgroundColor=[UIColor whiteColor];
    
    
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    for (UILabel *lbl in cell.contentView.subviews)
    {
        if ([lbl isKindOfClass:[UILabel class]])
        {
            [lbl removeFromSuperview];
        }
    }
    
    
    //    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    UILabel *Contentlbl =[[UILabel alloc]initWithFrame:CGRectMake(10,0,self.frame.size.width-20,self.frame.size.height/18)];
    Contentlbl.backgroundColor=[UIColor clearColor];
    Contentlbl.text=[orderProcessingarrya objectAtIndex:indexPath.row];
    Contentlbl.textColor=[UIColor blackColor];
    Contentlbl.textAlignment=NSTextAlignmentLeft;
    Contentlbl.font=[UIFont fontWithName:@"Helvetica" size:16];
    [cell.contentView addSubview:Contentlbl];
    
    
    UIView *lineView =[[UIView alloc]initWithFrame:CGRectMake(0, Contentlbl.frame.origin.y+Contentlbl.frame.size.height-5, SCREEN_WIDTH, 1.2)];
    lineView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [Contentlbl addSubview:lineView];
    
    if(indexPath.row == [orderProcessingarrya count] -1){
        
        lineView.hidden=YES;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.contentView.backgroundColor=RGB(248, 218, 218);
    
    if ([self.TableProcessingDelegate respondsToSelector:@selector(GetSelectedObject:)]) {
        
        [self.TableProcessingDelegate GetSelectedObject:indexPath];
        
    }

    NormalAnimation(AlertPopUpView, 0.50f,
                    
                    CGRect popFrame=self->AlertPopUpView.frame;
                    popFrame.origin.y=SCREEN_HEIGHT;
                    
                    self->AlertPopUpView.frame=popFrame;
                    
                    
                    
                    )
completion:^(BOOL finished){
    [self removeFromSuperview];
    [self.TableProcessingDelegate CancelView];
    
    
}];
    

    
    
}

@end
