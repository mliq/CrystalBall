//
//  MLViewController.m
//  CrystalBall
//
//  Created by Michael Liquori on 9/11/14.
//  Copyright (c) 2014 Team Treehouse. All rights reserved.
//

#import "MLViewController.h"
#import "MLCrystalBall.h"
#import <AudioToolbox/AudioToolbox.h>

@interface MLViewController ()

@end

@implementation MLViewController {
    SystemSoundID soundEffect;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"crystal_ball" ofType:@"mp3"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID(CFBridgingRetain(soundURL), &soundEffect);
    
    self.crystalBall= [[MLCrystalBall alloc] init];
//    automate array creation
    NSMutableArray *myArray = [NSMutableArray array];
    for(int i = 1; i < 10; i++) {
//        NSLog(@"CB0000%i",i);
        NSString *file= [NSString stringWithFormat:@"CB0000%d",i];
        [myArray addObject:[UIImage imageNamed:file]];
     //    NSLog(@"myArray:\n%@", myArray);
        //NSLog(@"%@",file);
        //NSString *file = [NSString stringWithFormat:@"CB0000%i",i];
        //NSLog(@"i= %@",file);
        //[myArray addObject:[UIImage imageNamed:file]];
         //[NSNumber numberWithInt:i]];
    }
    for(int i = 10; i < 61; i++) {
        NSString *file= [NSString stringWithFormat:@"CB000%d",i];
        [myArray addObject:[UIImage imageNamed:file]];
    }
    self.backgroundImageView.animationImages=myArray;
   // NSLog(@"myArray:\n%@", myArray);
    //UIImage *backgroundImage = [UIImage imageNamed:@"background"];
    //UIImageView *imageView = [[UIImageView alloc] initWithImage: backgroundImage];
    //[self.view insertSubview:imageView atIndex:0];
	// Do any additional setup after loading the view, typically from a nib.
    //self.predictions=[[NSArray alloc] initWithObjects:@"It is certain",@"It is decidedly so",@"All signs say yes",@"The stars are not aligned",nil];
    //[self.predictions objectAtIndex:0];
    //self.colors=[[NSArray alloc] initWithObjects:[UIColor redColor],[UIColor greenColor],[UIColor blueColor], nil];
   // NSLog(@"Array Count: %lu",(unsigned long)myArray.count);
    self.backgroundImageView.animationDuration=2.5f;
    self.backgroundImageView.animationRepeatCount=1;
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //CGRect frame = self.predictionLabel.frame;
     // self.predictionLabel.frame = CGRectMake(frame.origin.x,200,frame.size.width,frame.size.height);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Events
- (IBAction)buttonPressed {
    self.predictionLabel.text=nil;
    self.predictionLabel.alpha=0;
    [self makePrediction];
    //self.predictionLabel.text=[self.crystalBall randomPrediction];
    //int random=arc4random_uniform(self.predictions.count);
    //int random2=arc4random_uniform(self.colors.count);
    //NSArray *predictions = { [[NSArray alloc] initWithObjects:@"It is certain",@"It is decidedly so",@"All signs say yes",@"The stars are not aligned",nil]
    //self.predictionLabel.text=[self.predictions objectAtIndex:random];
    //self.predictionLabel.text=[predictions objectAtIndex:0];
    //self.predictionLabel.text=@"YES";
    //self.predictionLabel.textColor= [UIColor redColor];
    //self.predictionLabel.textColor= [self.colors objectAtIndex:random2];
    //NSLog(@"Button Pressed");
}
#pragma mark - Prediction
- (void) makePrediction {
    [self.backgroundImageView startAnimating];
    self.predictionLabel.text = [self.crystalBall randomPrediction];
    AudioServicesPlaySystemSound(soundEffect);
    [UIView animateWithDuration:4 animations:^{
        self.predictionLabel.alpha=1;
    }];
    
}

#pragma mark - Motion Events

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    self.predictionLabel.text=nil;
    self.predictionLabel.alpha=0;
    //NSLog(@"motion began");
}
- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"motion ended");
    if (motion== UIEventSubtypeMotionShake) {
        //self.predictionLabel.text = [self.crystalBall randomPrediction];
        [self makePrediction];
    }
}
- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
}

#pragma mark - Touch Events
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.predictionLabel.text=nil;
    self.predictionLabel.alpha=0;
}
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self makePrediction];
}

@end
