//
//  CCIAbacusDataSource2.h
//  Socotelnita
//
//  Created by Cristian Cosneanu on 10/10/17.
//  Copyright © 2017 Cristian Cosneanu. All rights reserved.
//

#ifndef CCIAbacusDataSource2_h
#define CCIAbacusDataSource2_h

@class CCIAbacusView;
@class CCIBead;

@protocol CCIAbacusDataSource

- (int)numberOfColumnsForAbacusView:(CCIAbacusView *)view ;
- (int)abacusView:(CCIAbacusView *)view numberOfBeadsPerSection: (int)sectionNumber;
- (int)abacusView:(CCIAbacusView *)view valueOfBeadsPerSection: (int)sectionNumber;
- (BOOL)showSeparatorForAbacusView:(CCIAbacusView *)view;
- (UIColor *)separatorColorForAbacusView:(CCIAbacusView *)view;
- (CCIBead *)abacusView:(CCIAbacusView *)view setBeadForColumn: (int) column withIndex: (int)index;

@end

#endif 
