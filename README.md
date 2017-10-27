# Redmine Wiki Page Tree Plugin

This plugin makes a page tree view in the sidebar.
And you can edit parent-child relationship of wiki pages by drag & drop.

## Screenshot

![スクリーンショット](image/screenshot.gif)

## Installation
1. Clone or copy files into the Redmine plugins directory
  ```
  git clone https://github.com/ledsun/redmine_wiki_page_tree.git plugins/redmine_wiki_page_tree
  ```
2. Restart Redmine

## License
This plugin is released under the MIT License.

## To Develop or to try to Use a sample

Use the [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/) to create a development environment.

1. Start server
  ```
  docker-compose up redmine
  ```

2. Open http://localhost in your browser
3. Login the redmine as `admin` with password `admin`
4. Create a project
5. Open wiki of that project
6. Create some wiki pages and edit their parent-child relationship 
