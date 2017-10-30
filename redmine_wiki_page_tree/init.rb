require_dependency 'redmine_wiki_page_tree_hook_listener'

Redmine::Plugin.register :redmine_wiki_page_tree do
  name 'Redmine Wiki Page Tree Plugin'
  author 'Shigeru Nakajima'
  description 'Redmine plugin to show the page tree view at the sidebar.'
  version '0.0.1'
  url 'https://github.com/ledsun/redmine_wiki_page_tree'
  author_url 'https://github.com/ledsun'
end
