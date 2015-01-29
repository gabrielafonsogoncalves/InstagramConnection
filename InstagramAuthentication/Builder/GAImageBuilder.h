//
//  GAImageBuilder.h
//  ImagesCarousel
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GARegularImage.h"

@interface GAImageBuilder : NSObject

- (GARegularImage *)buildObjectFromJSON:(NSDictionary *)json;

@end
