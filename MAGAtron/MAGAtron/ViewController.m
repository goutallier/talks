//
//  ViewController.m
//  MAGAtron
//
//  Created by Geoffrey Goutallier on 17/05/2017.
//  Copyright © 2017 Tessell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSMutableArray *paintingsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _paintingsArray = [[NSMutableArray alloc] init];
    
    NSArray *tempArray = @[@"George Seurat", @"Marée basse à Grandcamp", @"24C5D819-38D1-4EB2-8C85-4E3366F1E476.jpg",@"Un bateau échoué sur la plage"];
    [_paintingsArray addObject:[tempArray copy]];
    tempArray = @[@"George Seurat", @"Une baignade à Asnière", @"A51EEFD5-B993-40EE-8519-407D1BE40DDE.jpg", @"Des gens se baignent à Asnière"];
    [_paintingsArray addObject:[tempArray copy]];
    tempArray = @[@"La cabane à idée", @"Pointillisme à la cire", @"94607846-CB9F-4407-B927-CFE24E8B4FF1.jpg", @"Un bateau rouge sur la mer"];
    [_paintingsArray addObject:[tempArray copy]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_paintingsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *paintingCell = @"PaintingCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:paintingCell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:paintingCell];
    }
    
    cell.textLabel.text = [[_paintingsArray objectAtIndex:indexPath.row] objectAtIndex:1];
    cell.imageView.image = [UIImage imageNamed:[[_paintingsArray objectAtIndex:indexPath.row] objectAtIndex:2]];
//    cell.imageView.isAccessibilityElement = true;
    
//    cell.imageView.accessibilityTraits = UIAccessibilityTraitImage;
//    cell.imageView.accessibilityLabel = [[_paintingsArray objectAtIndex:indexPath.row] objectAtIndex:3];
    
//----
    cell.accessibilityLabel = [NSString stringWithFormat:@"%@, %@. Description : %@"
                               , [[_paintingsArray objectAtIndex:indexPath.row] objectAtIndex:0]
                               , [[_paintingsArray objectAtIndex:indexPath.row] objectAtIndex:1]
                               , [[_paintingsArray objectAtIndex:indexPath.row] objectAtIndex:3]];
//    
    return cell;
}

//- Delegate

@end
