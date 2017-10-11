//
//  MyStackView.m
//  Socotelnita
//
//  Created by Cristian Cosneanu on 10/8/17.
//  Copyright © 2017 Cristian Cosneanu. All rights reserved.
//

#import "CCIStackView.h"
#import "CCIAbacusDataSource.h"
#import "CCIAbacusDelegate.h"
#import "CCIBead.h"

@interface CCIStackView() <CCIAbacusDelegate>

@end

@implementation CCIStackView

-(instancetype)initWithNumberOfBeads:(int)num andValue:(int)value forColum: (int)column forDataSource:(id)dataSource{
    self = [super init];
    if (self) {
        _selectedIndex = 0;
        self.axis = UILayoutConstraintAxisVertical;
        self.distribution  = UIStackViewDistributionFillEqually;
        self.alignment = UIStackViewAlignmentFill;
        self.spacing = 2;
        _allBeads = [[NSMutableArray alloc] init];
        [_allBeads addObject:[UIView new]];
        
        int i = 0;
        while (++i <= num) {
            if ([dataSource conformsToProtocol:@protocol(CCIAbacusDataSource)]) {
                CCIBead *b = [dataSource abacusView:NULL setBeadForColumn:column withIndex:i];
                [b addPanGesture];
                b.beadId = i;
                b.value = value;
                b.delegate = self;
                [_allBeads addObject: b];
            } else {
                CCIBead *b = [[CCIBead alloc] initWithId:i];
                b.value = value;
                b.delegate = self;
                [_allBeads addObject: b];
            }
        }
        [self arrangeSubviews];
    }
    return self;
}

- (int)total {
    _total = 0;
    for (CCIBead *b in _allBeads) {
        if ([b isMemberOfClass:[CCIBead class]] && b.isMoved) {
            _total += b.value;
        }
    }
    return _total;
}

- (void) arrangeSubviews {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    int i = 0;
    for (CCIBead *b in _allBeads){
        [self addArrangedSubview:b];
        if ([b isKindOfClass:[CCIBead class]]) {
            b.beadId = i;
        }
        i++;
    }
}

- (void) didPerfomPanFor:(int)index withDirection:(int)directon {
    if (directon == 0) { //up
        for (int i = _selectedIndex; i < index ; i++){
            [_allBeads exchangeObjectAtIndex:i withObjectAtIndex:i + 1];
            CCIBead *b = _allBeads[i];
            if ([b isMemberOfClass:[CCIBead class]]) {
                b.isMoved = YES;
            }
            _selectedIndex = index;
        }
    } else if (directon == 1) {
        for (int i = _selectedIndex; i > index; i--){
            [_allBeads exchangeObjectAtIndex:i withObjectAtIndex:i - 1];
            CCIBead *b = _allBeads[i];
            if ([b isMemberOfClass:[CCIBead class]]) {
                b.isMoved = NO;
            }
            _selectedIndex = index;
        }
    }
    [self arrangeSubviews];
    [_delegate didChangeValue];
}


@end
