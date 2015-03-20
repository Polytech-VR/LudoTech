//
//  AddEditionViewController.m
//  LudoTech
//
//  Created by Valentin Bercot on 18/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

// ===== DEFINITION =====

#import "AddEditionViewController.h"

@implementation AddEditionViewController

// ===== INSTANCE METHODS =====

- (IBAction)save:(id)sender
{
    // TODO Save in database
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
