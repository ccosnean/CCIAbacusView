//
//  MyStackView.h
//  Socotelnita
//
//  Created by Cristian Cosneanu on 10/8/17.
//  Copyright © 2017 Cristian Cosneanu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CCIAbacusDelegate;

@interface CCIStackView : UIStackView
@property (nonatomic, nonnull) NSMutableArray *allBeads;
@property (nonatomic) int selectedIndex;
@property (nonatomic) int total;
@property (nonatomic, weak, nullable) id <CCIAbacusDelegate> delegate;

- (instancetype _Nullable )initWithNumberOfBeads: (int)num andValue:(int)value forColum: (int)column forDataSource: (_Nullable id) dataSource;
- (void) arrangeSubviews;

@end
