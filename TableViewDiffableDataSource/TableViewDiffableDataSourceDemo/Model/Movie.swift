//
//  Movie.swift
//  TableViewDiffableDataSourceDemo
//
//  Created by SHIH-YING PAN on 2019/7/14.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import Foundation

//根據 UITableViewDiffableDataSource 的定義，section & item 的辨識型別必須遵從 protocol Hashable
//將用 hash value 判斷資料的變化，然後再以生動的動畫呈現新增刪除的效果

//section 的辨識型別我們習慣用 enum 定義，因為表格的 section 的主要目的是分類，而 enum 的 case 很適合用來描述分類，因此表格 section 的數量即是 enum 裡 case 的數量
//由於 enum 本身就遵從 Hashable，所以不用再加上:Hashable (搭配 associated value 的 enum 例外)
enum Section: String, CaseIterable {
    case romance
    case adventure
}

// item 的辨識型別我們習慣使用表格要顯示的資料型別，因此在這裡我們使用 struct 定義的型別 Movie
struct Movie: Hashable {
    var name: String
    var actor: String
    var year: Int
}
