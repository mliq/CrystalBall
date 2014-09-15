//
//  MLCrystalBall.h
//  CrystalBall
//
//  Created by Soledad Liquori on 9/13/14.
//  Copyright (c) 2014 mliqu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLCrystalBall : NSObject {
    NSArray *_predictions;
}

//@property (strong,nonatomic,readonly) NSArray *predictions; It works without this now that all is in the method

- (NSString*) randomPrediction;

@end
