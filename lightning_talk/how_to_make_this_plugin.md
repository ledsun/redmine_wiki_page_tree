# Redmine Wikiのページツリー構造をドラッグ&ドロップで編集できる
## プラグインを作りました

2017/11/18 中島 滋
@redmine.tokyo 第13回勉強会

---

# 自己紹介

- 中島 滋 a.k.a. ledsun
- 普段はRedmineを使っていません
- 受託開発
- JavaScriptとRuby
- Webアプリケーション

---

# Demo

とりあえず見て
かっこいいでしょ？

---

# 3分間クッキング

Remineプラグインを作ってみましょう

---

# 開発環境はDocker

DB(MySQL)のインストールが不要

`docker-compose up` で
必要なイメージのダウンロードから起動まで

---

# generateコマンド

必要なファイルを作成してくれる

`docker-compose exec redmine bundle exec rails generate redmine_plugin redmine_wiki_page_tree`



---

# データを投入

あらかじめ用意しておいたWikiのデータをmysqlコマンドで投入

```
docker-compose exec db sh -c 'mysql --default-character-set=utf8 -uroot -predmine redmine < /work/wiki_data.sql'
```

---

# プラグインを追加

- `redmine_wiki_page_tree_hook_listener.rb` 追加
- `init.rb` でプラグインを登録

---

# 動作確認

（動いたら拍手してください）

---

# `redmine_wiki_page_tree_hook_listener.rb`

View Hook `view_layouts_base_sidebar`を定義

```rb
def view_layouts_base_sidebar(context = {})
  return unless context[:controller]
  params = context[:controller].params
  return unless params[:controller] == 'wiki'

  pages = load_pages(context[:request].params[:project_id])
  pages_by_parent_id = pages.group_by(&:parent_id)

  content_tag(:div, class: 'page-tree') do
    concat content_tag(:h2, 'ページツリービュー', class: 'page-tree__title')
    concat render_page_hierarchy(pages_by_parent_id, nil, :timestamp => true)
  end
end
```

---

# init.rb

```rb
require_dependency 'redmine_wiki_page_tree_hook_listener'

Redmine::Plugin.register :redmine_wiki_page_tree do
  name 'Redmine Wiki Page Tree Plugin'
  author 'Shigeru Nakajima'
  description 'Redmine plugin to show the page tree view at the sidebar.'
  version '0.0.1'
  url 'https://github.com/ledsun/redmine_wiki_page_tree'
  author_url 'https://github.com/ledsun'
end
```

---

# インデントを整形

CSSを追加

```css
#sidebar .page-tree {
    margin-left: -12px;
    padding-top: 10px;
}

#sidebar .page-tree__title {
    margin-left: 12px;
}

#sidebar .page-tree__list {
    margin: 0 12px;
}

#sidebar .page-tree__list__node--leaf {
    list-style-type: disc;
    margin-left: 13px;
}
```

---

# assetの追加
`redmine_wiki_page_tree_hook_listener.rb`

```rb
def view_layouts_base_html_head(context)
  return unless context[:controller]
  params = context[:controller].params
  return unless params[:controller] == 'wiki'

  tags = []
  tags << stylesheet_link_tag('sidebar__page-tree', :plugin => 'redmine_wiki_page_tree')
  tags << javascript_include_tag('sidebar__page-tree', :plugin => 'redmine_wiki_page_tree')
  tags.join("\n")
end
```
---

# おわり

プラグインのGithubリポジトリ

- `https://github.com/ledsun/redmine_wiki_page_tree`

Qiitaのプラグインの作り方の記事

- `https://qiita.com/ledsun/items/2f9d49679906ee36bc1e`
- `https://qiita.com/ledsun/items/c73a4b5ad3fa4e4e992d`


---
# 準備

- 作業ディレクトリに`docker-compose.yml`と`wiki_data.sql`を配置
- 最初の`docker-compose up`
- 初回ログイン
- `docker-compose kill`
- Demo用のRedmineを起動、Wikiを開く

---

## 片付け

- `docker-compose rm`
- `rm -rf redmine_wiki_page_tree/`
- `rm -rf log/`
