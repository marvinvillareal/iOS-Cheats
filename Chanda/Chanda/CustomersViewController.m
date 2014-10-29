//
//  CustomersViewController.m
//  Chanda
//
//  Created by Mohammad Azam on 10/25/11.
//  Copyright (c) 2011 HighOnCoding. All rights reserved.
//

#import "CustomersViewController.h"

@implementation CustomersViewController

@synthesize customers; 

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self populateCustomers];
}

-(void) populateCustomers 
{
    self.customers = [[NSMutableArray alloc] init];
    
    FMDBDataAccess *db = [[FMDBDataAccess alloc] init];
    
    self.customers = [db getCustomers];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
  
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"AddCustomer"]) 
    {
        UINavigationController *navigationController = segue.destinationViewController; 
        AddCustomerViewController *addCustomerViewController = [[navigationController viewControllers] objectAtIndex:0];
        addCustomerViewController.delegate = self; 
    }
    
    else if([segue.identifier isEqualToString:@"EditCustomer"]) 
    {
        UINavigationController *navigationController = segue.destinationViewController; 
        AddCustomerViewController *addCustomerViewController = [[navigationController viewControllers] objectAtIndex:0];
        addCustomerViewController.delegate = self; 
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Customer *customer = [self.customers objectAtIndex:[indexPath row]];
        addCustomerViewController.customerToEdit = customer; 
        
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

-(void) addCustomerViewControllerDidCancel:(AddCustomerViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void) addCustomerViewController:(AddCustomerViewController *)controller didEditCustomer:(Customer *)customer
{
    FMDBDataAccess *db = [[FMDBDataAccess alloc] init];
    
    [db updateCustomer:customer];
    
    [self populateCustomers];
    
    [self.tableView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) addCustomerViewController:(AddCustomerViewController *)controller didAddCustomer:(Customer *)customer
{
    FMDBDataAccess *db = [[FMDBDataAccess alloc] init];
    
    [db insertCustomer:customer];
    
    [self populateCustomers];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.customers count] - 1 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.customers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomerCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    Customer *customer = [self.customers objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@ %@",customer.firstName,customer.lastName]];
    
    return cell;
}


@end
