//
//  AppDelegate.h
//  LudoTech
//
//  Created by Valentin Bercot on 19/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

// ===== DECLARATION =====

@interface AppDelegate : UIResponder <UIApplicationDelegate>

// ===== PROPERTIES =====

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

// ===== METHODS =====

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

