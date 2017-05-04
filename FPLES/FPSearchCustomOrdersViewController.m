//
//  FPSearchCustomOrdersViewController.m
//  
//
//  Created by Apple on 11/04/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "FPSearchCustomOrdersViewController.h"
#import "FPOrderDetailsClass.h"
#import "FPSearchCustomerOrderTableViewCell.h"
#import "FPSearchCustomerDetailViewController.h"

@interface FPSearchCustomOrdersViewController ()
{
    
    NSArray *searchResults;
    NSArray *allArrays;
    
    
}

@end

@implementation FPSearchCustomOrdersViewController
@synthesize myTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    float width;
    float height;
    
    width = [[UIScreen mainScreen] bounds].size.width;
    height = [[UIScreen mainScreen] bounds].size.height;
    
    UIImage *backGroundImage = [self imageWithImage:[UIImage imageNamed:@"BackGround_For_All"] scaledToSize:CGSizeMake(width, height)];
    self.view.backgroundColor  = [UIColor colorWithPatternImage:backGroundImage];

    self.myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    FPOrderDetailsClass *custom1=[FPOrderDetailsClass new];
    custom1.orders=@"1";
    custom1.firstname=@"Daniel";
    custom1.lastname=@"Anthony";
    custom1.orderdate=@"1/1/2016";
    custom1.price=@"$19.90";
    custom1.city=@"Dallas";
    custom1.state=@"TX";
     NSDictionary *dic1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"Productimage1.png",@"image",@"SurgeShield Only",@"name",@"$9.95 plus tax",@"detail",nil];
    
     NSDictionary *dic2 = [[NSDictionary alloc]initWithObjectsAndKeys:@"Productimage2.png",@"image",@"Electronics Surge Protection Only",@"name",@"$9.95 plus tax" ,@"detail",nil];
    
    NSArray *arr = [[NSArray alloc]initWithObjects:dic1,dic2, nil];
    custom1.productsList = arr;
    
    
    NSLog(@"%@",custom1.productsList);
    
    
    FPOrderDetailsClass *custom2=[FPOrderDetailsClass new];
    custom2.orders=@"2";
    custom2.firstname=@"James";
    custom2.lastname=@"William";
    custom2.orderdate=@"3/2/2016";
    custom2.price=@"$19.90";
    custom2.city=@"Columbus";
    custom2.state=@"OH";
    custom2.productsList=arr;
    
    FPOrderDetailsClass *custom3=[FPOrderDetailsClass new];
    custom3.orders=@"3";
    custom3.firstname=@"David";
    custom3.lastname=@"Andrew";
    custom3.orderdate=@"5/3/2016";
    custom3.price=@"$19.90";
    custom3.city=@"New york";
    custom3.state=@"NY";
    custom3.productsList=arr;
    
    FPOrderDetailsClass *custom4=[FPOrderDetailsClass new];
    custom4.orders=@"4";
    custom4.firstname=@"Jacob";
    custom4.lastname=@"kevin";
    custom4.orderdate=@"7/4/2016";
    custom4.price=@"$19.90";
    custom4.city=@"Hampton";
    custom4.state=@"VA";
    custom4.productsList=arr;
    
    FPOrderDetailsClass *custom5=[FPOrderDetailsClass new];
    custom5.orders=@"5";
    custom5.firstname=@"Gabriel";
    custom5.lastname=@"John";
    custom5.orderdate=@"7/4/2016";
    custom5.price=@"$19.90";
    custom5.city=@"Miami";
    custom5.state=@"FL";
    custom5.productsList=arr;
    
    allArrays=[NSArray arrayWithObjects:custom1,custom2,custom3,custom4,custom5,nil];
    myTableView.delegate=self;
    [myTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [allArrays count];
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
    FPSearchCustomerOrderTableViewCell *cell = (FPSearchCustomerOrderTableViewCell*)[self.myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[FPSearchCustomerOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    FPOrderDetailsClass *customcell= [FPOrderDetailsClass new];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        customcell=[searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        customcell=[allArrays objectAtIndex:indexPath.row];
    }
    cell.OrdersLbl.text=customcell.orders;
    cell.FtrstName.text=customcell.firstname;
    cell.LastName.text=customcell.lastname;
    cell.DateLbl.text=customcell.orderdate;
    cell.CityLbl.text=customcell.city;
    cell.StateLbl.text=customcell.state;
    cell.PriceLbl.text=customcell.price;
    cell.selectionStyle=UITableViewCellSeparatorStyleNone;
    cell.selectionStyle=UITableViewCellSeparatorStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        //        [self performSegueWithIdentifier: @"FPSearchOrderDetailViewController" sender: self];
    }
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"cellToDetailViewController"]) {
        FPSearchCustomerDetailViewController *destViewController = segue.destinationViewController;
        
        NSIndexPath *indexPath = nil;
        if ([self.searchDisplayController isActive]) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            destViewController.detaillist = [searchResults objectAtIndex:indexPath.row];
            
        } else {
            indexPath = [myTableView indexPathForSelectedRow];
            destViewController.detaillist = [allArrays objectAtIndex:indexPath.row];
        }
    }
    
}
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *namepredicate = [NSPredicate predicateWithFormat:@"firstname contains[c] %@", searchText];
    NSPredicate *ordernumberpredicate = [NSPredicate predicateWithFormat:@"orders contains[c] %@", searchText];
    NSPredicate *orderdatepredicate = [NSPredicate predicateWithFormat:@"orderdate contains[c] %@", searchText];
    NSPredicate *finalpredicate=[NSCompoundPredicate orPredicateWithSubpredicates:@[namepredicate,orderdatepredicate,ordernumberpredicate]];
    
    searchResults = [allArrays filteredArrayUsingPredicate:finalpredicate];
    
    
    
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (IBAction)HomeScreenBackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}


- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



@end
