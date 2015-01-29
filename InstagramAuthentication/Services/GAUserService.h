//
//  GAUserService.h
//  InstagramAuthentication
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GAUserDelegate.h"

@interface GAUserService : NSObject

@property (strong, nonatomic) id<GAUserDelegate> delegate;

- (void)fetchUserInformation;

@end
