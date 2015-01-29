//
//  GAImageBuilder.m
//  ImagesCarousel
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "GAImageBuilder.h"
#import "GAPost.h"

@implementation GAImageBuilder

- (GAPost *)buildObjectFromJSON:(NSDictionary *)json {
    NSDictionary *images = json[@"images"];
    NSDictionary *thumbnail = images[@"thumbnail"];
    GAPost *image = [[GAPost alloc] init];
    image.imageLink = thumbnail[@"url"];
    
    return image;
}

@end
