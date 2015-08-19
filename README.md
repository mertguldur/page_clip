# page_clip

[![Build Status](https://travis-ci.org/mertguldur/page_clip.svg?branch=master)](https://travis-ci.org/mertguldur/page_clip)

Page clip calculates the pages to display in a paginator based on item count, items per page, current page and number of pages to display.

## Installation

```ruby
gem 'page_clip'
```

## Examples

```ruby
pages, last_page = PageClip.show \
  item_count: 100,
  per_page: 10,
  current_page: 1,
  pages_to_show_count: 5
pages # => [1, 2, 3, 4, 5]
last_page # => 10

pages, last_page = PageClip.show \
  item_count: 100,
  per_page: 20,
  current_page: 3,
  pages_to_show_count: 3
pages # => [2, 3, 4]
last_page # => 5
```
