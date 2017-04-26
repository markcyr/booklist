class BooksController < ApplicationController


    def index
      @books = Book.all
      respond_to do |format|
        format.html
        format.text
        format.csv { render text: @books.to_csv }
        format.json {render json: @books }

      end
    end




end
