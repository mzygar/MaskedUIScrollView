//
//  NOKViewController.m
//  ScrollerMask
//
//  Created by Michal Zygar on 30.07.2012.
//  Copyright (c) 2012 Grupa Nokaut S.A. All rights reserved.
//

#import "NOKViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface NOKViewController ()

@end

@implementation NOKViewController
@synthesize scrollview;
@synthesize container;


- (void)viewDidLoad
{
    [super viewDidLoad];
    for (int i=0; i<3; i++) {
        NSString* string=[NSString stringWithFormat:@"beach%i.jpg",(3-i)];
        UIImage * image=[UIImage imageNamed:string];
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(i*1024, 0, 1024, 748)];
        [imageView setImage:image];
        [self.scrollview addSubview:imageView];
    }
    
    [scrollview setContentSize:CGSizeMake(3*1024, 748)];
    
    CALayer *maskLayer=[CALayer layer];
    [maskLayer setFrame:CGRectMake(0, 0, 1024, 768)];
    maskLayer.contents =(id)[[UIImage imageNamed:@"mask2a.png"] CGImage];
    
    self.container.layer.mask=maskLayer;
    [self.container.layer setMasksToBounds:YES];
    [self.container.layer setNeedsDisplay];
}


- (void)viewDidUnload
{
    [self setScrollview:nil];
    [self setContainer:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)dealloc {
    [scrollview release];
    [container release];
    [super dealloc];
}
@end
