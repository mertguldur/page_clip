require 'page_clip'

describe PageClip do
  describe '.show' do
    context 'item count' do
      context '0 items, 10 per page, page 1, 5 pages to show' do
        it 'returns pages: [1], last_page: 1' do
          pages, last_page = described_class.show \
            item_count: 0,
            per_page: 10,
            current_page: 1,
            pages_to_show_count: 5
          expect(pages).to eq([])
          expect(last_page).to eq(0)
        end
      end

      context '10 items, 10 per page, page 1, 5 pages to show' do
        it 'returns pages: [1], last_page: 1' do
          pages, last_page = described_class.show \
            item_count: 10,
            per_page: 10,
            current_page: 1,
            pages_to_show_count: 5
          expect(pages).to eq([1])
          expect(last_page).to eq(1)
        end
      end

      context '20 items, 10 per page, page 1, 5 pages to show' do
        it 'returns pages: [1, 2], last_page: 2' do
          pages, last_page = described_class.show \
            item_count: 20,
            per_page: 10,
            current_page: 1,
            pages_to_show_count: 5
          expect(pages).to eq([1, 2])
          expect(last_page).to eq(2)
        end
      end

      context '50 items, 10 per page, page 1, 5 pages to show' do
        it 'returns pages: [1, 2, 3, 4, 5], last_page: 5' do
          pages, last_page = described_class.show \
            item_count: 50,
            per_page: 10,
            current_page: 1,
            pages_to_show_count: 5
          expect(pages).to eq([1, 2, 3, 4, 5])
          expect(last_page).to eq(5)
        end
      end

      context '60 items, 10 per page, page 1, 5 pages to show' do
        it 'returns pages: [1, 2, 3, 4, 5], last_page: 6' do
          pages, last_page = described_class.show \
            item_count: 60,
            per_page: 10,
            current_page: 1,
            pages_to_show_count: 5
          expect(pages).to eq([1, 2, 3, 4, 5])
          expect(last_page).to eq(6)
        end
      end
    end

    context 'per page' do
      context '50 items, 10 per page, page 1, 5 pages to show' do
        it 'returns pages: [1, 2, 3, 4, 5], last_page: 5' do
          pages, last_page = described_class.show \
            item_count: 50,
            per_page: 10,
            current_page: 1,
            pages_to_show_count: 5
          expect(pages).to eq([1, 2, 3, 4, 5])
          expect(last_page).to eq(5)
        end
      end

      context '50 items, 25 per page, page 1, 5 pages to show' do
        it 'returns pages: [1, 2], last_page: 2' do
          pages, last_page = described_class.show \
            item_count: 50,
            per_page: 25,
            current_page: 1,
            pages_to_show_count: 5
          expect(pages).to eq([1, 2])
          expect(last_page).to eq(2)
        end
      end

      context '50 items, 50 per page, page 1, 5 pages to show' do
        it 'returns pages: [1], last_page: 1' do
          pages, last_page = described_class.show \
            item_count: 50,
            per_page: 50,
            current_page: 1,
            pages_to_show_count: 5
          expect(pages).to eq([1])
          expect(last_page).to eq(1)
        end
      end

      context '50 items, 60 per page, page 1, 5 pages to show' do
        it 'returns pages: [1], last_page: 1' do
          pages, last_page = described_class.show \
            item_count: 50,
            per_page: 60,
            current_page: 1,
            pages_to_show_count: 5
          expect(pages).to eq([1])
          expect(last_page).to eq(1)
        end
      end
    end

    context 'current page' do
      context '60 items, 10 per page, page 1, 5 pages to show' do
        it 'returns pages: [1, 2, 3, 4, 5], last_page: 6' do
          pages, last_page = described_class.show \
            item_count: 60,
            per_page: 10,
            current_page: 1,
            pages_to_show_count: 5
          expect(pages).to eq([1, 2, 3, 4, 5])
          expect(last_page).to eq(6)
        end
      end

      context '60 items, 10 per page, page 3, 5 pages to show' do
        it 'returns pages: [1, 2, 3, 4, 5], last_page: 6' do
          pages, last_page = described_class.show \
            item_count: 60,
            per_page: 10,
            current_page: 3,
            pages_to_show_count: 5
          expect(pages).to eq([1, 2, 3, 4, 5])
          expect(last_page).to eq(6)
        end
      end

      context '60 items, 10 per page, page 4, 5 pages to show' do
        it 'returns pages: [2, 3, 4, 5, 6], last_page: 6' do
          pages, last_page = described_class.show \
            item_count: 60,
            per_page: 10,
            current_page: 4,
            pages_to_show_count: 5
          expect(pages).to eq([2, 3, 4, 5, 6])
          expect(last_page).to eq(6)
        end
      end

      context '60 items, 10 per page, page 6, 5 pages to show' do
        it 'returns pages: [2, 3, 4, 5, 6], last_page: 6' do
          pages, last_page = described_class.show \
            item_count: 60,
            per_page: 10,
            current_page: 6,
            pages_to_show_count: 5
          expect(pages).to eq([2, 3, 4, 5, 6])
          expect(last_page).to eq(6)
        end
      end
    end

    context 'pages to show count' do
      context '50 items, 10 per page, page 1, 5 pages to show' do
        it 'returns pages: [1, 2, 3, 4, 5], last_page: 5' do
          pages, last_page = described_class.show \
            item_count: 50,
            per_page: 10,
            current_page: 1,
            pages_to_show_count: 5
          expect(pages).to eq([1, 2, 3, 4, 5])
          expect(last_page).to eq(5)
        end
      end

      context '50 items, 10 per page, page 1, 3 pages to show' do
        it 'returns pages: [1, 2, 3], last_page: 5' do
          pages, last_page = described_class.show \
            item_count: 50,
            per_page: 10,
            current_page: 1,
            pages_to_show_count: 3
          expect(pages).to eq([1, 2, 3])
          expect(last_page).to eq(5)
        end
      end

      context '50 items, 10 per page, page 1, 1 page to show' do
        it 'returns pages: [1], last_page: 5' do
          pages, last_page = described_class.show \
            item_count: 50,
            per_page: 10,
            current_page: 1,
            pages_to_show_count: 1
          expect(pages).to eq([1])
          expect(last_page).to eq(5)
        end
      end
    end

    context 'invalid arguments' do
      context 'negative item count' do
        it 'throws an exception' do
          expect do
            described_class.show \
              item_count: -1,
              per_page: 10,
              current_page: 1,
              pages_to_show_count: 5
          end.to raise_error("Item count can't be negative!")
        end
      end

      context 'zero per page' do
        it 'throws an exception' do
          expect do
            described_class.show \
              item_count: 10,
              per_page: 0,
              current_page: 1,
              pages_to_show_count: 5
          end.to raise_error('Per page must be positive!')
        end
      end

      context 'zero current page' do
        it 'throws an exception' do
          expect do
            described_class.show \
              item_count: 10,
              per_page: 10,
              current_page: 0,
              pages_to_show_count: 5
          end.to raise_error('Current page must be positive!')
        end
      end

      context 'zero pages to show count' do
        it 'throws an exception' do
          expect do
            described_class.show \
              item_count: 10,
              per_page: 10,
              current_page: 1,
              pages_to_show_count: 0
          end.to raise_error('Pages to show count must be positive!')
        end
      end

      context 'even pages to show count' do
        it 'throws an exception' do
          expect do
            described_class.show \
              item_count: 10,
              per_page: 10,
              current_page: 1,
              pages_to_show_count: 2
          end.to raise_error('Pages to show count must be an odd number!')
        end
      end

      context 'current page is greater than the last page' do
        it 'throws an exception' do
          expect do
            described_class.show \
              item_count: 10,
              per_page: 10,
              current_page: 2,
              pages_to_show_count: 5
          end.to raise_error("Current page can't be greater than the last page!")
        end
      end
    end
  end
end
