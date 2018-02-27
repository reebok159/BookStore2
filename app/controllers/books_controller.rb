class BooksController < ApplicationController
  load_resource

  def index
    @books = Book.select_category(params[:category])
                 .select_sort(params[:sort])
                 .page(params[:page])
                 .decorate
  end

  def show
    @book = @book.decorate
    @review = Review.new
    @reviews = @book.reviews.accepted.decorate
  end
end
