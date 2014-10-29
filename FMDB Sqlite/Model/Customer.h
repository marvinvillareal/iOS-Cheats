//
//  Customer.h
//  Chanda
//
//  Created by Mohammad Azam on 10/25/11.
//  Copyright (c) 2011 HighOnCoding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject
{
    
}

@property (nonatomic,assign) int customerId; 
@property (readonly,retain) NSString *name; 
@property (nonatomic,strong) NSString *firstName; 
@property (nonatomic,strong) NSString *lastName;

@end
