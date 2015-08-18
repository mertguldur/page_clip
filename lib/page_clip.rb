class PageClip
  def initialize(total_item_count, current_page, per_page, options = {})
    @total_item_count       = total_item_count
    @current_page           = current_page
    @per_page               = per_page
    @pages_to_display_count = options[:pages_to_display_count] || 5

    @total_page_count = total_page_count
    @total_pages      = total_pages
    @side_page_count  = side_page_count
  end

  def self.calculate(total_item_count, current_page, per_page, options = {})
    new(total_item_count, current_page, per_page, options).calculate
  end

  def calculate
    [pages_to_display, @total_page_count]
  end

  private

  def pages_to_display
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
    pages_to_add_count = @side_page_count + extra_page_count

    pages_to_add_count.times do
      page = direction == :left ? page - 1 : page + 1
      pages << page if @total_pages.include?(page)
    end

    missed_page_count = pages_to_add_count - pages.size
    [pages, missed_page_count]
  end

  def total_page_count
    (@total_item_count.to_f / @per_page.to_f).ceil
  end

  def total_pages
    (1..@total_page_count).to_set
  end

  def side_page_count
    (@pages_to_display_count - 1) / 2
  end
end
