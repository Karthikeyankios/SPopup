//
//  OrderProcessing.h
//  CooperChimney
//
//  Created by Karthik  on 02/10/18.
//  Copyright © 2016 Karthik . All rights reserved.
//
//https://github.com/Karthikeyankios/SPopup.git

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@protocol PopupDelegate <NSObject>

@required
-(void)GetSelectedObject:(NSIndexPath *)Index;
-(void)CancelView;

@end
@interface SPopup : UIControl
{
    
}
@property (nonatomic, assign) id<PopupDelegate> TableProcessingDelegate;


- (id)initWithFrame:(CGRect)frame delegate:(id<PopupDelegate>)delegate;

-(void)ProcessingMethod:(NSArray *)Titlearray Title:(NSString *)TitileStr;

@end
