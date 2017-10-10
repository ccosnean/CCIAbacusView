//
//  Bead.m
//  Socotelnita
//
//  Created by Cristian Cosneanu on 10/8/17.
//  Copyright © 2017 Cristian Cosneanu. All rights reserved.
//

#import "CCIBead.h"
#import "CCIAbacusDelegate.h"

@implementation CCIBead

- (instancetype)initWithId:(int)beadId {
    self = [super init];
    if (self) {
        _beadId = beadId;
        [self addPanGesture];
        [self setBeadLook];
    }
    return self;
}

- (void) addPanGesture {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesturePerformed:)];
    [self addGestureRecognizer:pan];
}

- (void) setBeadId:(int)newVal {
    _beadId = newVal;
}

- (void) setBeadLook {
    self.backgroundColor = [UIColor blueColor];
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = true;
}

- (void) panGesturePerformed:(UIPanGestureRecognizer *)panGesture {
    CGPoint vel = [panGesture velocityInView:self];
    if (vel.y <= 0)
    {
        // user dragged up
        if (!_isMoved) {
            [_delegate didPerfomPanFor:_beadId withDirection:0];
        }
    }
    else
    {
        // user dragged down
        if (_isMoved) {
            [_delegate didPerfomPanFor:_beadId withDirection:1];
        }
    }
}

@end
