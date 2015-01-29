//
//  GAImageService.m
//  ImagesCarousel
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "GAImageService.h"
#import "GAPost.h"
#import "AppDelegate.h"
#import "GAImageBuilder.h"

@implementation GAImageService

- (void)fetchImages {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    [manager GET:[NSString stringWithFormat:@"https://api.instagram.com/v1/users/self/feed?access_token=%@", [AppDelegate token]] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSMutableArray *posts = [[NSMutableArray alloc] init];
        GAImageBuilder *builder = [[GAImageBuilder alloc] init];
        for (NSDictionary *json in responseObject[@"data"]) {
            GAPost *post = [builder buildObjectFromJSON:json];
            [posts addObject:post];
        }
        
        [self.delegate showImages:posts];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [self.delegate showImages:nil];
    }];
}

- (void)loadImage:(NSString *)address inImageView:(UIImageView *)imageView
{
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:address]];
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    requestOperation.responseSerializer = [AFImageResponseSerializer serializer];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Response: %@", responseObject);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image = responseObject;
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Image error: %@", error);
        imageView.image = [UIImage imageNamed:@"ic_no_image"];
    }];
    [requestOperation start];
}

@end
