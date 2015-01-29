//
//  GAQueueService.m
//  PlayStationRSSFeed
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "GAQueueService.h"

@implementation GAQueueService

+ (dispatch_queue_t)queue:(NSString *)queueName
{
    static NSMutableDictionary* queues;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queues = [[NSMutableDictionary alloc] init];
    });
    
    if (!queues[queueName]) {
        queues[queueName] = (id)(dispatch_queue_create(queueName.UTF8String, NULL));
    }
    
    return (dispatch_queue_t)(queues[queueName]);
}

@end
