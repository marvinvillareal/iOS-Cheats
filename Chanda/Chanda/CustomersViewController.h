//
//  CustomersViewController.h
//  Chanda
//
//  Created by Mohammad Azam on 10/25/11.
//  Copyright (c) 2011 HighOnCoding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDBDataAccess.h" 
#import "AddCustomerViewController.h" 

@interface CustomersViewController : UITableViewController<AddCustomerViewControllerDelegate>
{
    
}

@property (nonatomic,strong) NSMutableArray *customers; 

-(void) populateCustomers; 

@end
