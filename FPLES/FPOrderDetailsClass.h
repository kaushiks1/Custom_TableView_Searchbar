//
//  FPOrderDetailsClass.h
//  
//
//  Created by Mac2 on 14/04/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FPOrderDetailsClass : NSObject

@property(strong,nonatomic)NSString *orders;
@property(strong,nonatomic)NSString *firstname;
@property(strong,nonatomic)NSString *lastname;
@property(strong,nonatomic)NSString *orderdate;
@property(strong,nonatomic)NSString *city;
@property(strong,nonatomic)NSString *state;
@property(strong,nonatomic)NSString *price;
@property(strong,nonatomic)NSArray *productsList;



@end
