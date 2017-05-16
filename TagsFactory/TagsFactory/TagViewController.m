//
//  TagViewController.m
//  TagsFactory
//
//  Created by DoctorGG on 2017/5/10.
//  Copyright © 2017年 NETEASE. All rights reserved.
//

#import "TagViewController.h"
#import "SelectTagView.h"

@interface TagViewController ()

@property (strong, nonatomic) SelectTagView *selectTagView;

@property SelectTagCategory selectTagCategory;
@property SelectTag selectTag;

@property (assign, nonatomic) int currentTagCategory;
@property (copy, nonatomic) NSArray <Tag *> *tags;

@end

@implementation TagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self p_initialData];
    [self p_configUI];
    
    [self reloadTags];
}

#pragma mark - Config UI

- (void)p_initialData {
    self.currentTagCategory = 1;
    
    [self p_initialSelectTag];
    [self p_initalSelectTagCategory];
}

- (void)p_initalSelectTagCategory {
    __weak typeof(self) weakself = self;
    self.selectTagCategory = ^(NESTagCategoryStyle categoryStyle) {
        if (weakself.currentTagCategory == categoryStyle) {
            return ;
        }
        
        NSLog(@"Tag %ld is selected", categoryStyle);
        
        weakself.currentTagCategory = categoryStyle;
        [weakself reloadTags];
    };
}

- (void)p_initialSelectTag {
    self.selectTag = ^(Tag *tag) {
        NSLog(@"Tag name: %@", tag.name);
    };
}

- (void)p_configUI {
    [self p_configSetTagView];
}

- (void)p_configSetTagView {
    [self.view addSubview:self.selectTagView];
    
    [self.selectTagView setDatasourceSelectTag:self.selectTag andSelectTagCategory:self.selectTagCategory];
}

- (SelectTagView *)selectTagView {
    if (!_selectTagView) {
        _selectTagView = [[SelectTagView alloc] initWithFrame:self.view.bounds andStyle:self.tagStyle];
        _selectTagView.frame = self.view.bounds;
    }
    
    return _selectTagView;
}

- (void)reloadTags {
    NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        Tag *tag = [[Tag alloc] init];
        if (self.currentTagCategory == 1) {
            tag.name = [NSString stringWithFormat:@"Tag1-%d", i];
        } else {
            tag.name = [NSString stringWithFormat:@"Tag2-%d", i];
        }
        [tmpArray addObject:tag];
    }
    
    self.tags = tmpArray;
    
    [self.selectTagView reloadDataWithTag:self.tags category:self.currentTagCategory];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
