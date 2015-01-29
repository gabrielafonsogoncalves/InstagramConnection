//
//  GAUserService.m
//  InstagramAuthentication
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "GAUserService.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "AppDelegate.h"

@implementation GAUserService

- (void)fetchUserInformation {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"https://api.instagram.com/v1/users/self?access_token=%@", [AppDelegate token]] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [AppDelegate saveUserId:responseObject[@"data"][@"id"]];
        [self.delegate reloadUserInformation];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
