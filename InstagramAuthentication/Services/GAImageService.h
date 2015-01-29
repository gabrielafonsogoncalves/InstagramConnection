//
//  GAImageService.h
//  ImagesCarousel
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GAImageDelegate.h"

@interface GAImageService : NSObject

@property (strong, nonatomic) id<GAImageDelegate> delegate;

- (void)fetchImages;
- (void)loadImage:(NSString *)address inImageView:(UIImageView *)imageView;

@end
