//
//  Customer.m
//  Chanda
//
//  Created by Mohammad Azam on 10/25/11.
//  Copyright (c) 2011 HighOnCoding. All rights reserved.
//

#import "Customer.h"

@implementation Customer

@synthesize customerId,firstName,lastName,name;

-(NSString *) getName 
{
    return [NSString stringWithFormat:@"%@ %@",self.firstName,self.lastName]; 
}

@end
