//
//  BeadColumn.h
//  Socotelnita
//
//  Created by Cristian Cosneanu on 10/9/17.
//  Copyright © 2017 Cristian Cosneanu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCIStackView;
@protocol CCIAbacusDelegate;

@interface CCIBeadColumn : NSObject
@property (nonatomic)  CCIStackView * _Nullable bottomColumn;
@property (nonatomic) CCIStackView * _Nullable topColumn;
@property (nonatomic, weak, nullable) id <CCIAbacusDelegate> delegate;

- (instancetype _Nullable ) initWithColumnsTop: (CCIStackView *_Nullable)topCol andBottom: (CCIStackView *_Nullable)botCol;
- (int) getColumnValue;

@end
