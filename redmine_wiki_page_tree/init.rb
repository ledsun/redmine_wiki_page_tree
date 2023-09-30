require_dependency File.expand_path('./lib/redmine_wiki_page_tree_hook_listener', __dir__)

Redmine::Plugin.register :redmine_wiki_page_tree do
  name 'Redmine Wiki Page Tree Plugin'
  author 'Shigeru Nakajima'
  description 'Redmine plugin to show the page tree view at the sidebar.'
  version '0.0.3'
  url 'https://github.com/ledsun/redmine_wiki_page_tree'
  author_url 'https://github.com/ledsun'
end
