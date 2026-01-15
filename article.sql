-- 1. 插入最頂層：內容管理
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) 
VALUES (NULL, 'file', 0, 'content', '内容管理', 'fa fa-file-text', '', '', '', 1, NULL, '', 'nrgl', 'neirongguanli', 1766175633, 1766175633, 50, 'normal');

-- 獲取「內容管理」的 ID
SET @parent_id = LAST_INSERT_ID();

-- 2. 插入第二層：文章管理 (pid 指向內容管理)
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) 
VALUES (NULL, 'file', @parent_id, 'article', '文章管理', 'fa fa-newspaper-o', '', '', '', 1, NULL, '', 'wzgl', 'wenzhangguanli', 1766175633, 1766175633, 40, 'normal');

-- 獲取「文章管理」的 ID
SET @sub_id = LAST_INSERT_ID();

-- 3. 插入第三層：具體操作權限 (pid 全部指向文章管理)
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(NULL, 'file', @sub_id, 'article/index', '查看', '', '', '', '', 0, NULL, '', '', '', 1766175633, 1766175633, 0, 'normal'),
(NULL, 'file', @sub_id, 'article/add', '添加', '', '', '', '', 0, NULL, '', '', '', 1766175633, 1766175633, 0, 'normal'),
(NULL, 'file', @sub_id, 'article/edit', '编辑', '', '', '', '', 0, NULL, '', '', '', 1766175633, 1766175633, 0, 'normal'),
(NULL, 'file', @sub_id, 'article/del', '删除', '', '', '', '', 0, NULL, '', '', '', 1766175633, 1766175633, 0, 'normal'),
(NULL, 'file', @sub_id, 'article/multi', '批量操作', '', '', '', '', 0, NULL, '', '', '', 1766175633, 1766175633, 0, 'normal');

-- --------------------------------------------------------
-- 資料表結構 `fa_article`
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `fa_article` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '所属栏目',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` text COMMENT '文章内容',
  `cover_image` varchar(255) DEFAULT '' COMMENT '封面图片',
  `author` varchar(50) DEFAULT '' COMMENT '作者',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '排序权重',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='内容管理';

-- --------------------------------------------------------
-- 傾印資料表的資料 `fa_article` (已清理雜亂數據)
-- --------------------------------------------------------

INSERT INTO `fa_article` (`id`, `category_id`, `title`, `content`, `cover_image`, `author`, `views`, `status`, `weigh`, `createtime`, `updatetime`) VALUES
(NULL, 14, 'reiichoro-article 插件：極簡主義的內容管理實踐', '<p>這是一款基於 FastAdmin 開發的高性能文章管理插件。它摒棄了繁瑣的「我們」，回歸到純粹的「工具與意志」邏輯。</p>', '', 'reiichoro', 128, 'normal', 1, 1766180111, 1766180151),
(NULL, 14, '關於內容去識別化與 SEO 優化策略', '<p>在現代網絡環境中，保護個人信息與優化搜索權重同樣重要。本插件內置了深度 SEO 優化工具，幫助開發者精準掌控每一條數據的傳播方向。</p>', '', 'reiichoro', 85, 'normal', 2, 1766513268, 1766513268),
(NULL, 14, '如何高效配置 FastAdmin 權限節點', '<p>通過 SQL 變量動態設置 pid，可以實現權限樹的快速遷移。掌握 LAST_INSERT_ID() 是每個獨立開發者的必備技能。</p>', '', 'Admin', 42, 'normal', 3, 1766514668, 1766514668),
(NULL, 14, 'Laravel 11 與 ThinkPHP 數據結構的異同分析', '<p>雖然核心邏輯不同，但在處理 CRUD 操作時，兩者都強調了數據的完整性。本項目展示了如何在 ThinkPHP 框架下實現 Laravel 式的高雅架構。</p>', '', 'System', 67, 'normal', 4, 1766517865, 1766518376),
(NULL, 14, '架構師的自我修養：拒絕集體主義的模糊邊界', '<p>正如凱瑞甘在艦橋上的宣告，這裡只有開發者的意志與受控的代碼。reiichoro-article 旨在賦予單體開發者最強大的武裝。</p>', '', 'reiichoro', 256, 'normal', 5, 1766518075, 1766518395);

COMMIT;