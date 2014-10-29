//
//  AddCustomerViewController.m
//  Chanda
//
//  Created by Mohammad Azam on 10/25/11.
//  Copyright (c) 2011 HighOnCoding. All rights reserved.
//

#import "AddCustomerViewController.h"

@implementation AddCustomerViewController

@synthesize delegate,firstNameTextField,lastNameTextField,customerToEdit; 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

-(IBAction) done:(id) sender 
{
    if(self.customerToEdit != nil) 
    {
        self.customerToEdit.firstName = self.firstNameTextField.text; 
        self.customerToEdit.lastName = self.lastNameTextField.text; 
        
        if(![self validate:self.customerToEdit]) 
        {
            [Utility showAlert:@"Error" message:@"Validation Failed!"];
            return; 
        }
        
        [self.delegate addCustomerViewController:self didEditCustomer:self.customerToEdit];
    }
    
    else 
    {
        Customer *customer = [[Customer alloc] init];
        customer.firstName = self.firstNameTextField.text; 
        customer.lastName = self.lastNameTextField.text; 
        
        if(![self validate:customer]) 
        {
            [Utility showAlert:@"Error" message:@"Validation Failed!"];
            return; 
        }
        
        [self.delegate addCustomerViewController:self didAddCustomer:customer];
    }
  
}

-(BOOL) validate:(Customer *)c
{
    if(([c.firstName length] == 0) || ([c.lastName length] == 0)) 
    {
        return NO; 
    }
    
    return YES; 
}

-(IBAction)cancel:(id)sender
{
    [self.delegate addCustomerViewControllerDidCancel:self];
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(self.customerToEdit != nil) 
    {
        self.title = [NSString stringWithFormat:@"%@ %@",self.customerToEdit.firstName,self.customerToEdit.lastName]; 
        self.firstNameTextField.text = self.customerToEdit.firstName; 
        self.lastNameTextField.text = self.customerToEdit.lastName; 
        
    }
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
