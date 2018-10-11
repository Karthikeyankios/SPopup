//
//  ViewController.m
//  SPopup
//
//  Created by Karthik  on 02/10/18.
//  Copyright © 2016 Karthik . All rights reserved.
//

#define SCREEN_HEIGHT                    [UIScreen mainScreen].bounds.size.height

#define SCREEN_WIDTH                    [UIScreen mainScreen].bounds.size.width

#define NormalAnimation(_inView,_duration,_frames)            [UIView transitionWithView:_inView duration:_duration options:UIViewAnimationOptionTransitionNone animations:^{ _frames    }

#import "ViewController.h"
#import "SPopup.h"
@interface ViewController ()<PopupDelegate>
{
    SPopup* OpanPopup;
    NSArray *Totalsalearray;
    UIButton *PopupBtn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    PopupBtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-SCREEN_WIDTH/4,SCREEN_HEIGHT/2-20,SCREEN_WIDTH/2,40)];
    [PopupBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    PopupBtn.backgroundColor=[UIColor redColor];
    PopupBtn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16];
    PopupBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [PopupBtn setTitle:@"Show Popup" forState:UIControlStateNormal];
    [PopupBtn addTarget:self action:@selector(ShowPopup) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:PopupBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ShowPopup
{
    OpanPopup= [[SPopup alloc]init];
    OpanPopup.backgroundColor=[UIColor colorWithWhite:0.00 alpha:0.4];
    OpanPopup.frame = CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
    OpanPopup.TableProcessingDelegate=self;
    [self.view addSubview:OpanPopup];
    Totalsalearray =[[NSArray alloc]initWithObjects:@"One",@"Two",@"Three",@"Four",@"Five", nil];
    [OpanPopup ProcessingMethod:Totalsalearray Title:@"Your Title"];
    
    NormalAnimation(OpanPopup, 0.70f,
                    
                    CGRect popFrame=self->OpanPopup.frame;
                    popFrame.origin.y=0;
                    self->OpanPopup.frame=popFrame;
                    
                    )
completion:^(BOOL finished){
    
    
}];
}

#pragma mark - Spopup REgoired Delegate Method

-(void)GetSelectedObject:(NSIndexPath *)Index;
{
    NSLog(@"Selected string -->%@",[Totalsalearray objectAtIndex:Index.row]);
    [PopupBtn setTitle:[Totalsalearray objectAtIndex:Index.row] forState:UIControlStateNormal];
    
}
-(void)CancelView
{
    //When Cancel clicked this method will Called.
    //Do any other code you want.
}




@end
