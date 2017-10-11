//
//  CCIAbacusDelegate2.h
//  Socotelnita
//
//  Created by Cristian Cosneanu on 10/10/17.
//  Copyright © 2017 Cristian Cosneanu. All rights reserved.
//

#ifndef CCIAbacusDelegate_h
#define CCIAbacusDelegate_h
#import <UIKit/UIKit.h>

@class CCIAbacusView;

@protocol CCIAbacusDelegate

@optional
- (void)abacusView:(CCIAbacusView *)view didChangeValue: (int)newValue;
- (void) didPerfomPanFor: (int)index withDirection:(int)directon;
- (void) didChangeValue;

@end

#endif
