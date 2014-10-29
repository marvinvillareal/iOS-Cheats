//
//  FMDBDataAccess.h
//  Chanda
//
//  Created by Mohammad Azam on 10/25/11.
//  Copyright (c) 2011 HighOnCoding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h" 
#import "FMResultSet.h" 
#import "Utility.h" 
#import "Customer.h" 

@interface FMDBDataAccess : NSObject
{
    
}

-(NSMutableArray *) getCustomers; 
-(BOOL) insertCustomer:(Customer *) customer; 
-(BOOL) updateCustomer:(Customer *) customer; 

@end
