//
//  AddCustomerViewController.h
//  Chanda
//
//  Created by Mohammad Azam on 10/25/11.
//  Copyright (c) 2011 HighOnCoding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customer.h" 
#import "Utility.h" 

@class Customer; 
@class AddCustomerViewController; 

@protocol AddCustomerViewControllerDelegate<NSObject>

-(void) addCustomerViewController:(AddCustomerViewController *) controller 
                   didAddCustomer:(Customer *) customer; 

-(void) addCustomerViewController:(AddCustomerViewController *)controller didEditCustomer:(Customer *)customer; 

-(void) addCustomerViewControllerDidCancel:(AddCustomerViewController *) controller; 

@end

@interface AddCustomerViewController : UITableViewController<UITextFieldDelegate>
{
    
}

@property (nonatomic,strong) Customer *customerToEdit; 
@property (nonatomic,strong) IBOutlet UITextField *firstNameTextField; 
@property (nonatomic,strong) IBOutlet UITextField *lastNameTextField;
@property (nonatomic,weak) id<AddCustomerViewControllerDelegate> delegate; 

-(IBAction) done:(id) sender; 
-(IBAction) cancel:(id) sender; 

-(BOOL) validate:(Customer *) c; 

@end
