//
//  MLViewController.h
//  CrystalBall
//
//  Created by Michael Liquori on 9/11/14.
//  Copyright (c) 2014 Team Treehouse. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MLCrystalBall; //forward declaration, best practice rather import

@interface MLViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
@property (strong,nonatomic) MLCrystalBall *crystalBall;
//@property (strong,nonatomic) NSArray *predictions;
//@property (strong,nonatomic) NSArray *colors;

- (IBAction)buttonPressed;
- (void) makePrediction;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
