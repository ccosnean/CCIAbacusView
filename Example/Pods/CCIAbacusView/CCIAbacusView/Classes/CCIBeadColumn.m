//
//  BeadColumn.m
//  Socotelnita
//
//  Created by Cristian Cosneanu on 10/9/17.
//  Copyright © 2017 Cristian Cosneanu. All rights reserved.
//

#import "CCIBeadColumn.h"
#import "CCIAbacusDelegate.h"
#import "CCIStackView.h"

@interface CCIBeadColumn() <CCIAbacusDelegate>
@end

@implementation CCIBeadColumn

- (instancetype) initWithColumnsTop:(CCIStackView *)topCol andBottom:(CCIStackView *)botCol {
    self = [super init];
    if (self) {
        _topColumn = topCol;
        _bottomColumn = botCol;
        _topColumn.delegate = self;
        _bottomColumn.delegate = self;
    }
    return self;
}

- (int) getColumnValue {
    return _topColumn.total + _bottomColumn.total;
}

- (void) didChangeValue {
        [_delegate abacusView:nil didChangeValue:0];
}

@end
