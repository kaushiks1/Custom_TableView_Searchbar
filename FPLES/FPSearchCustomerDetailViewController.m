//
//  FPSearchCustomerDetailViewController.m
//  
//
//  Created by Mac2 on 14/04/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "FPSearchCustomerDetailViewController.h"
#import "FPSearchCustomerDetailOrderTableViewCell.h"

@interface FPSearchCustomerDetailViewController ()
{
    NSMutableArray *productslistArray;
    NSMutableArray *productsImagesArray;
    NSMutableArray *productsCostArray;
}

@end

@implementation FPSearchCustomerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.OrderLbl.text=[self.detaillist valueForKey:@"orders"];
    
    float width;
    float height;
    
    width = [[UIScreen mainScreen] bounds].size.width;
    height = [[UIScreen mainScreen] bounds].size.height;
    
    UIImage *backGroundImage = [self imageWithImage:[UIImage imageNamed:@"BackGround_For_All"] scaledToSize:CGSizeMake(width, height)];
    self.view.backgroundColor  = [UIColor colorWithPatternImage:backGroundImage];
    
    self.tblSearchCustomDetail.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.detaillist.productsList count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FPSearchCustomerDetailOrderTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[FPSearchCustomerDetailOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    

    cell.ProductNameLbl.text=[[self.detaillist.productsList objectAtIndex:indexPath.row]objectForKey:@"name"];
    cell.ProductImage.image=[UIImage imageNamed:[[self.detaillist.productsList objectAtIndex:indexPath.row]objectForKey:@"image"]];
    
    cell.ProductCostLbl.text=[[self.detaillist.productsList objectAtIndex:indexPath.row]objectForKey:@"detail"];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.selectionStyle=UITableViewCellSeparatorStyleNone;
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SearchOrdersBackBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    

}


- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {

    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
