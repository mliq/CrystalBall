//
//  MLCrystalBall.h
//  CrystalBall
//
//  Created by Michael Liquori on 9/13/14.
//  Copyright (c) 2014 Team Treehouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLCrystalBall : NSObject {
    NSArray *_predictions;
}

//@property (strong,nonatomic,readonly) NSArray *predictions; It works without this now that all is in the method

- (NSString*) randomPrediction;

@end
