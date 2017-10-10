//
//  Bead.h
//  Socotelnita
//
//  Created by Cristian Cosneanu on 10/8/17.
//  Copyright © 2017 Cristian Cosneanu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CCIAbacusDelegate;

@interface CCIBead : UIView
@property (nonatomic) BOOL isMoved;
@property (weak, nonatomic) id <CCIAbacusDelegate> delegate;
@property (nonatomic) int beadId;
@property (nonatomic) int value;

-(instancetype)initWithId:(int)beadId;

- (void) panGesturePerformed: (UIPanGestureRecognizer *)panGesture;
- (void) setBeadId:(int)newVal;
- (void) setBeadLook;
- (void) addPanGesture;
@end
