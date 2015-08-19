require 'set'

class PageClip
  def initialize(item_count, per_page, current_page, pages_to_show_count)
    verify_arguments(item_count, per_page, current_page, pages_to_show_count)

    @current_page = current_page
    @page_count = (item_count.to_f / per_page.to_f).ceil
    @pages = (1..@page_count).to_set
    @side_pages_to_show_count = (pages_to_show_count - 1) / 2
  end

  def self.show(item_count:, per_page:, current_page:, pages_to_show_count:)
    new(item_count, per_page, current_page, pages_to_show_count).calculate
  end

  def calculate
    [pages_to_show, @page_count]
  end

  private

  def pages_to_show
    return [] if @page_count.zero?

    verify_current_page

    pages = [@current_page]

    pages_to_add, left_missed_page_count = side_pages_to_add(:left)
    pages += pages_to_add

    if left_missed_page_count > 0
      pages += side_pages_to_add(:right, left_missed_page_count).first
      return pages.sort
    end

    pages_to_add, right_missed_page_count = side_pages_to_add(:right)
    pages += pages_to_add

    if right_missed_page_count > 0
      pages += side_pages_to_add(:left, right_missed_page_count).first
    end

    pages.uniq.sort
  end

  def side_pages_to_add(direction, extra_page_count = 0)
    pages = []
    page = @current_page
    pages_to_add_count = @side_pages_to_show_count + extra_page_count

    pages_to_add_count.times do
      page = direction == :left ? page - 1 : page + 1
      pages << page if @pages.include?(page)
    end

    missed_page_count = pages_to_add_count - pages.size
    [pages, missed_page_count]
  end

  def verify_arguments(item_count, per_page, current_page, pages_to_show_count)
    fail "Item count can't be negative!" if item_count < 0
    fail 'Per page must be positive!' if per_page <= 0
    fail 'Current page must be positive!' if current_page <= 0
    fail 'Pages to show count must be positive!' if pages_to_show_count <= 0
    fail 'Pages to show count must be an odd number!' if pages_to_show_count.even?
  end

  def verify_current_page
    fail "Current page can't be greater than the last page!" if @current_page > @page_count
  end
end
