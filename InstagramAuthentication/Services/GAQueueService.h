//
//  GAQueueService.h
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GAQueueService : NSObject

+ (dispatch_queue_t)queue:(NSString*)queueName;

@end
