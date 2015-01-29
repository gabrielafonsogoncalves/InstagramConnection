//
//  GAImageCollectionDataSource.m
//  InstagramAuthentication
//
//  Created by Gabriel Afonso on 1/29/15.
//  Copyright (c) 2015 ETC. All rights reserved.
//

#import "GAImageCollectionDataSource.h"
#import "GACollectionViewCell.h"
#import "GAImageService.h"
#import "GAPost.h"

@implementation GAImageCollectionDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GACollectionViewCell *cell;
    @try {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"insta-cell" forIndexPath:indexPath];
    }
    @catch (NSException *exception) {
    }
    @finally {
        if (!cell) {
            [collectionView registerNib:[UINib nibWithNibName:@"GACollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"insta-cell"];
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"insta-cell" forIndexPath:indexPath];
        }
    }
    
    
    GAPost *post = self.items[indexPath.row];
    
    GAImageService *imageService = [[GAImageService alloc] init];
    [imageService loadImage:post.imageLink inImageView:cell.postImageView];
    
    return cell;
}



@end
