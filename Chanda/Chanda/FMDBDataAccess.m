//
//  FMDBDataAccess.m
//  Chanda
//
//  Created by Mohammad Azam on 10/25/11.
//  Copyright (c) 2011 HighOnCoding. All rights reserved.
//

#import "FMDBDataAccess.h"

@implementation FMDBDataAccess


-(BOOL) updateCustomer:(Customer *)customer
{
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    
    [db open];
    
    BOOL success = [db executeUpdate:[NSString stringWithFormat:@"UPDATE customers SET firstname = '%@', lastname = '%@' where id = %d",customer.firstName,customer.lastName,customer.customerId]];
    
    [db close];
    
    return success; 
}

-(BOOL) insertCustomer:(Customer *) customer 
{
    // insert customer into database
    
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    
    [db open];
    
    BOOL success =  [db executeUpdate:@"INSERT INTO customers (firstname,lastname) VALUES (?,?);",
                     customer.firstName,customer.lastName, nil];
    
    [db close];
    
    return success; 
    
    return YES; 
}

-(NSMutableArray *) getCustomers
{
    NSMutableArray *customers = [[NSMutableArray alloc] init];
    
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    
    [db open];
    
    FMResultSet *results = [db executeQuery:@"SELECT * FROM customers"];
    
    while([results next]) 
    {
        Customer *customer = [[Customer alloc] init];
        
        customer.customerId = [results intForColumn:@"id"];
        customer.firstName = [results stringForColumn:@"firstname"];
        customer.lastName = [results stringForColumn:@"lastname"];
        
        [customers addObject:customer];
        
    }
    
    [db close];
  
    return customers; 

}

@end
