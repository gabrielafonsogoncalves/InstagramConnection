//
//  GAImageCollectionDataSource.h
//  InstagramAuthentication
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GAImageCollectionDataSource : NSObject <UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *items;

@end
