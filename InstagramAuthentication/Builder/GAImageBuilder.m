//
//  GAImageBuilder.m
//  ImagesCarousel
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "GAImageBuilder.h"

@implementation GAImageBuilder

- (GARegularImage *)buildObjectFromJSON:(NSDictionary *)json
{
    GARegularImage *image = [[GARegularImage alloc] init];
    image.imageLink = json[@"image_url"];
    image.title = json[@"caption"];
    return image;
}

@end
