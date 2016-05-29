//
//  RootTableViewAdaptor.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/25.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "RootPlainTableViewAdaptor.h"
#import "RootTableViewCell.h"
#import <objc/runtime.h>
#define ActionButtonMaxWidth 60
@interface RootPlainTableViewAdaptor()
@property(nonatomic,strong) NSMutableDictionary *dataSourceDict;
@end
@implementation RootPlainTableViewAdaptor

#pragma mark private 私有方法
/**
 *  获取对应的section 的数据源
 *
 *  @param section 对应的section 值这个值是0开始的
 *
 *  @return section 数据源的数组
 */
- (NSMutableArray<RootTableViewAdaptorItemBaseProtocol> *)cellItemArrayForSection:(NSInteger)section
{
    if(self.tableView.numberOfSections>section)
    {
     NSMutableArray<RootTableViewAdaptorItemBaseProtocol> *sectionArray = [self.dataSourceDict objectForKey:[NSString stringWithFormat:@"section_%li",(long)section]];
     if(!sectionArray)
     {
         sectionArray = (NSMutableArray<RootTableViewAdaptorItemBaseProtocol> *)[[NSMutableArray alloc] init];
         [self.dataSourceDict setObject:sectionArray forKey:[NSString stringWithFormat:@"section_%li",(long)section]];
     }
    return sectionArray;
    }
    return nil;
 
}
/**
 *  对应的section 对应的单元格数目
 *
 *  @param section section index
 *
 *  @return 返回这个section 单元格的个数
 */
- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
   NSMutableArray<RootTableViewAdaptorItemBaseProtocol> *sectionArray = [self cellItemArrayForSection:section];
   if(sectionArray)
   {
       return sectionArray.count;
   }
    return 0;
}
/**
 *  根据indexPath 获取对应的数据源
 *
 *  @param indexPath
 *
 *  @return
 */
- (id<RootTableViewAdaptorItemBaseProtocol>)objectForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<RootTableViewAdaptorItemBaseProtocol> object = nil;
    NSMutableArray *cellItemArray = [self cellItemArrayForSection:indexPath.section];
    if(indexPath.row>cellItemArray.count)
    {
        return object;
    }
    else
    {
        object = cellItemArray[indexPath.row];
    }
    return object;
}

/**
 *  根据indexPath 获取重用的标示
 *
 *  @param indexPath
 *
 *  @return
 */
- (NSString *)identifierForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<RootTableViewAdaptorItemBaseProtocol> item = [self objectForRowAtIndexPath:indexPath];
    if(item)
    {
        if(item.cellIdentifier)
        {
            return item.cellIdentifier;
        }
        else if (item.cellClass)
        {
            return NSStringFromClass(item.cellClass);
        }
    }
    
    return @"cell";
}
/**
 *  根据indexPath 获取单元格类
 *
 *  @param indexPath
 *
 *  @return
 */
- (Class)cellClassForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<RootTableViewAdaptorItemBaseProtocol> item = [self objectForRowAtIndexPath:indexPath];
    if(item)
    {
        if(item.cellClass)
        {
            return item.cellClass;
        }
        
    }
    return [RootTableViewCell class];
}
/**
 *  根据indexPath 获取单元的高度
 *
 *  @param tableView
 *  @param indexPath
 *
 *  @return
 */
- (float)tableView:(UITableView *)tableView cellHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    id<RootTableViewAdaptorItemBaseProtocol> item = [self objectForRowAtIndexPath:indexPath];
     Class cellClass = [self cellClassForRowAtIndexPath:indexPath];
     Method method = class_getClassMethod(cellClass, @selector(tableView:rowHeightForObject:));
     if(method)
     {
      height=[cellClass tableView:tableView rowHeightForObject:item];
     }
    return height;
}

#pragma mark  UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)])
    {
        [self.delegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if([self.delegate respondsToSelector:@selector(tableView:willDisplayHeaderView:forSection:)])
    {
        [self.delegate tableView:tableView willDisplayHeaderView:view forSection:section];
    }
}
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    if([self.delegate respondsToSelector:@selector(tableView:willDisplayFooterView:forSection:)])
    {
        [self.delegate tableView:tableView willDisplayFooterView:view forSection:section];
    }
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    if([self.delegate respondsToSelector:@selector(tableView:didEndDisplayingCell:forRowAtIndexPath:)])
    {
        [self.delegate tableView:tableView didEndDisplayingCell:cell forRowAtIndexPath:indexPath];
    }
}
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if([self.delegate respondsToSelector:@selector(tableView:didEndDisplayingHeaderView:forSection:)])
    {
        [self.delegate tableView:tableView didEndDisplayingHeaderView:view forSection:section];
    }
}
- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section
{
    if([self.delegate respondsToSelector:@selector(tableView:didEndDisplayingFooterView:forSection:)])
    {
        [self.delegate tableView:tableView  didEndDisplayingFooterView:view forSection:section];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self tableView:tableView cellHeightForRowAtIndexPath:indexPath];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if([self.delegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)])
    {
        return [self.delegate tableView:tableView heightForHeaderInSection:section];
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if([self.delegate respondsToSelector:@selector(tableView:heightForFooterInSection:)])
    {
        return [self.delegate tableView:tableView heightForFooterInSection:section];
    }
    return 0;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if([self.delegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)])
    {
        return [self.delegate tableView:tableView viewForHeaderInSection:section];
    }
    return nil;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if([self.delegate respondsToSelector:@selector(tableView:viewForFooterInSection:)])
    {
        return [self.delegate tableView:tableView viewForFooterInSection:section];
    }
    return nil;
}

// Selection

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(tableView:shouldHighlightRowAtIndexPath:)])
    {
        return [self.delegate tableView:tableView shouldHighlightRowAtIndexPath:indexPath];
    }
    return YES;
}
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(tableView:didHighlightRowAtIndexPath:)])
    {
        return [self.delegate tableView:tableView didHighlightRowAtIndexPath:indexPath];
    }
}
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(tableView:didUnhighlightRowAtIndexPath:)])
    {
        return [self.delegate tableView:tableView didUnhighlightRowAtIndexPath:indexPath];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<RootTableViewAdaptorItemBaseProtocol> item = [self objectForRowAtIndexPath:indexPath];
    if([self.delegate respondsToSelector:@selector(tableView:didSelectWithCellDataSource:)])
    {
        [self.delegate tableView:tableView didSelectWithCellDataSource:item];
    }
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(tableView:editingStyleForRowAtIndexPath:)])
    {
       return [self.delegate tableView:tableView editingStyleForRowAtIndexPath:indexPath];
    }
    return UITableViewCellEditingStyleNone;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(tableView:titleForDeleteConfirmationButtonForRowAtIndexPath:)])
    {
        return [self.delegate tableView:tableView titleForDeleteConfirmationButtonForRowAtIndexPath:indexPath];
    }
    return @"删除";
}
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(tableView:editActionsForRowAtIndexPath:)])
    {
        [self.delegate tableView:tableView editActionsForRowAtIndexPath:indexPath];
    }
    return nil;
}


#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self numberOfRowsInSection:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<RootTableViewAdaptorItemBaseProtocol>item = [self objectForRowAtIndexPath:indexPath];
    NSString *cellIdentifier = [self identifierForRowAtIndexPath:indexPath];
    Class cellClass = [self cellClassForRowAtIndexPath:indexPath];
    RootTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
    {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:item.cellIdentifier];
    }
    cell.cellDataSource = item;
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if([self.delegate respondsToSelector:@selector(numberOfSectionsInTableView:)])
    {
        return [self.delegate numberOfSectionsInTableView:tableView];
    }
    return 1;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if([self.delegate respondsToSelector:@selector(tableView:titleForHeaderInSection:)])
    {
        return [self tableView:tableView titleForHeaderInSection:section];
    }
    return nil;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if([self.delegate respondsToSelector:@selector(tableView:titleForFooterInSection:)])
    {
        return [self tableView:tableView titleForFooterInSection:section];
    }
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(tableView:canEditRowAtIndexPath:)])
    {
        return [self.delegate tableView:tableView canEditRowAtIndexPath:indexPath];
    }
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(tableView:canMoveRowAtIndexPath:) ])
    {
        return [self.delegate tableView:tableView canMoveRowAtIndexPath:indexPath];
    }
    return NO;
}

// Index

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if([self.delegate respondsToSelector:@selector(sectionIndexTitlesForTableView:)])
    {
        return [self.delegate sectionIndexTitlesForTableView:tableView];
    }
    return nil;
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if([self.delegate respondsToSelector:@selector(tableView:sectionForSectionIndexTitle:atIndex:)])
    {
        return [self.delegate tableView:tableView sectionForSectionIndexTitle:title atIndex:index];
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(tableView:commitEditingStyle:forRowAtIndexPath:)])
    {
        [self.delegate tableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
    }
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if([self.delegate respondsToSelector:@selector(tableView:moveRowAtIndexPath:toIndexPath:)])
    {
        [self.delegate tableView:tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    }
}
#pragma mark set/get
- (NSMutableDictionary *)dataSourceDict
{
    if(!_dataSourceDict)
    {
        _dataSourceDict = [[NSMutableDictionary alloc] init];
    }
    return _dataSourceDict;
}

@end
