//
//  FPSearchCustomerOrderTableViewCell.h
//  
//
//  Created by Mac2 on 14/04/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FPSearchCustomerOrderTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *OrdersLbl;
@property (weak, nonatomic) IBOutlet UILabel *DateLbl;
@property (weak, nonatomic) IBOutlet UILabel *FtrstName;
@property (weak, nonatomic) IBOutlet UILabel *LastName;
@property (weak, nonatomic) IBOutlet UILabel *CityLbl;
@property (weak, nonatomic) IBOutlet UILabel *StateLbl;
@property (weak, nonatomic) IBOutlet UILabel *PriceLbl;

@end
