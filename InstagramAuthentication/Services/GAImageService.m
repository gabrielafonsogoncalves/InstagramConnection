//
//  GAImageService.m
//  ImagesCarousel
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "GAImageService.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "GAImageBuilder.h"
#import "GARegularImage.h"

@implementation GAImageService

- (void)fetchImages
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://www.kogimobile.com/rm-carousel.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *images = [[NSMutableArray alloc] init];
        GAImageBuilder *builder = [[GAImageBuilder alloc] init];
        for (NSDictionary *json in responseObject[@"images"]) {
            GARegularImage *image = [builder buildObjectFromJSON:json];
            [images addObject:image];
        }
        
        [self.delegate showImages:images];
        
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
