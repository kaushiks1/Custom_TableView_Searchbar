//
//  FPSearchCustomerDetailViewController.h
//  
//
//  Created by Mac2 on 14/04/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPOrderDetailsClass.h"

@interface FPSearchCustomerDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *OrderLbl;
@property(strong,nonatomic)FPOrderDetailsClass *detaillist;
@property (strong, nonatomic) IBOutlet UIButton *SearchOrdersBackBtn;

@property (weak, nonatomic) IBOutlet UITableView *tblSearchCustomDetail;



- (IBAction)SearchOrdersBackBtn:(id)sender;

@end
