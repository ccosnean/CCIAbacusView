//
//  CCIViewController.m
//  CCIAbacusView
//
//  Created by ccosnean on 10/10/2017.
//  Copyright (c) 2017 ccosnean. All rights reserved.
//

#import "CCIViewController.h"
#import "CCIBead.h"
#import "CCIAbacusDelegate.h"
#import "CCIAbacusDataSource.h"
#import "CCIAbacusView.h"

@interface CCIViewController () <CCIAbacusDelegate, CCIAbacusDataSource>

@end

@implementation CCIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CCIAbacusView *CCIView = [[CCIAbacusView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.height - 40)];
    
    CCIView.delegete = self;
    CCIView.dataSource = self;
    [CCIView reloadData];
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.view addSubview:CCIView];
}

- (UIColor *)separatorColorForAbacusView:(CCIAbacusView *)view {
    return [UIColor blueColor];
}

- (int)abacusView:(CCIAbacusView *)view numberOfBeadsPerSection:(int)sectionNumber {
    if (sectionNumber == 0) // top column
        return 1;
    else                    // bottom column
        return 5;
}

- (int)numberOfColumnsForAbacusView:(CCIAbacusView *)view {
    return 5;
}

- (int)abacusView:(CCIAbacusView *)view valueOfBeadsPerSection:(int)sectionNumber {
    if (sectionNumber == 0) // the value that a bid can take
        return 5;
    else
        return 1;
}

- (BOOL)showSeparatorForAbacusView:(CCIAbacusView *)view {
    return YES;
}

- (CCIBead *) abacusView:(CCIAbacusView *)view setBeadForColumn:(int)column withIndex:(int)index {
    CCIBead *myBead = [[CCIBead alloc] init];
    if (column % 2 == 0) {
        myBead.backgroundColor = [UIColor orangeColor];
    } else {
        myBead.backgroundColor = [UIColor blueColor];
    }
    myBead.layer.cornerRadius = 20;
    myBead.clipsToBounds = YES;
    return myBead;
}

-(UIColor *) separatorColor {
    return [UIColor blueColor];
}

- (void)abacusView:(CCIAbacusView *)view didChangeValue:(int)newValue {
    printf("value = %d\n", newValue);
}


@end
