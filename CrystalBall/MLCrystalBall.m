//
//  MLCrystalBall.m
//  CrystalBall
//
//  Created by Michael Liquori on 9/13/14.
//  Copyright (c) 2014 Team Treehouse. All rights reserved.
//

#import "MLCrystalBall.h"

@implementation MLCrystalBall {
    //NSArray *setPredictions; I think the deal is we do not need a set method here because we are not allowing the value to be set from outside.
}

- (NSArray *) predictions{
    if(_predictions ==nil){
        _predictions = [[NSArray alloc] initWithObjects:@"It is certain",@"It is decidedly so",@"All signs say yes",@"The stars are not aligned",nil];
    }
    return _predictions;
}
- (NSString*) randomPrediction {
    int random=arc4random_uniform(self.predictions.count);
    return [self.predictions objectAtIndex:random];
}
@end
