//
//  CCIAbacusView.h
//  Socotelnita
//
//  Created by Cristian Cosneanu on 10/9/17.
//  Copyright © 2017 Cristian Cosneanu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CCIAbacusDelegate;
@protocol CCIAbacusDataSource;

@interface CCIAbacusView : UIView

@property (nonatomic, weak, nullable) id <CCIAbacusDelegate> delegete;
@property (nonatomic, weak, nullable) id <CCIAbacusDataSource> dataSource;

- (void) reloadData;
@end
