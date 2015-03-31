//
//  LanguageTableViewController.h
//  LudoTech
//
//  Created by Valentin Bercot on 18/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LanguageTableViewCell.h"

// ===== DECLARATION =====

@interface LanguageTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *errorDelete;

// ===== METHODS =====

- (void) appDelegateAndfetchedResultControllerInit;
- (id)initWithStyle:(UITableViewStyle)style;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller;
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller;
- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath;
- (void)configureCell:(LanguageTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
