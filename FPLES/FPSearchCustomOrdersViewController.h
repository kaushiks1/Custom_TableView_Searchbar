//
//  FPSearchCustomOrdersViewController.h
//  
//
//  Created by Apple on 11/04/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FPSearchCustomOrdersViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)HomeScreenBackBtn:(id)sender;

@end
