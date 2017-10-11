//
//  CCIAbacusView.m
//  Socotelnita
//
//  Created by Cristian Cosneanu on 10/9/17.
//  Copyright © 2017 Cristian Cosneanu. All rights reserved.
//

#import "CCIAbacusView.h"
#import "CCIAbacusDataSource.h"
#import "CCIAbacusDelegate.h"
#import "CCIBeadColumn.h"
#import "CCIStackView.h"

@interface CCIAbacusView() <CCIAbacusDelegate>
@property (nonatomic, strong) NSMutableArray * _Nullable columns;
@end

@implementation CCIAbacusView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self reloadData];
    }
    return self;
}

- (void) reloadData {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (_dataSource) {
        int nrOfTopBeads = [_dataSource abacusView: self numberOfBeadsPerSection:0];
        int nrOfBottomBeads = [_dataSource abacusView:self numberOfBeadsPerSection:1];
        int cols = [_dataSource numberOfColumnsForAbacusView:self];
        int topValue = [_dataSource abacusView:self valueOfBeadsPerSection:0];
        int bottomValue = [_dataSource abacusView:self valueOfBeadsPerSection:1];

        float oneBidHeight = self.frame.size.height / (nrOfTopBeads + nrOfBottomBeads + 2);
        float topHeight = (oneBidHeight * (nrOfTopBeads + 1)) - 10;
        UIStackView *topStack = [[UIStackView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, topHeight)];
        UIStackView *bottomStack = [[UIStackView alloc] initWithFrame:CGRectMake(0, topStack.frame.size.height + 10, self.frame.size.width, oneBidHeight * (nrOfBottomBeads + 1))];
        
        topStack.axis = UILayoutConstraintAxisHorizontal;
        topStack.distribution  = UIStackViewDistributionFillEqually;
        topStack.alignment = UIStackViewAlignmentFill;
        topStack.spacing = 2;
        
        bottomStack.axis = UILayoutConstraintAxisHorizontal;
        bottomStack.distribution  = UIStackViewDistributionFillEqually;
        bottomStack.alignment = UIStackViewAlignmentFill;
        bottomStack.spacing = 2;
        
        _columns = [NSMutableArray new];
        for (int i=0; i < cols; i++){
            CCIBeadColumn *col = [[CCIBeadColumn alloc]
                                  initWithColumnsTop:[[CCIStackView alloc] initWithNumberOfBeads:nrOfTopBeads andValue:topValue forColum:cols - i - 1 forDataSource:_dataSource]
                                  andBottom:[[CCIStackView alloc] initWithNumberOfBeads:nrOfBottomBeads andValue:bottomValue forColum:i forDataSource:_dataSource]];
            col.delegate = self;
            [_columns addObject:col];
        }
        
        for (CCIBeadColumn *b in _columns) {
            [topStack addArrangedSubview: b.topColumn];
            [bottomStack addArrangedSubview: b.bottomColumn];
        }
        
        if ([_dataSource showSeparatorForAbacusView:self]) {
            UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, topStack.frame.size.height + 4, self.frame.size.width, 2)];
            if ([_dataSource separatorColorForAbacusView:self])
                separator.backgroundColor = [_dataSource separatorColorForAbacusView:self];
            [self addSubview:separator];
        }
        
        [topStack setTransform: CGAffineTransformMakeRotation(M_PI)];
        [self addSubview:topStack];
        [self addSubview:bottomStack];
    }
}

- (void)abacusView:(CCIAbacusView *)view didChangeValue: (int)newValue {
    [_delegete abacusView:self didChangeValue:[self totalValue]];
}

- (int) totalValue {
    int value = 0;
    for (CCIBeadColumn *b in _columns) {
        value += b.getColumnValue;
    }
    return value;
}

@end
