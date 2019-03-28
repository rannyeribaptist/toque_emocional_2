class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  layout "users"

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  def list
    @books = Book.all
    render layout: "book"
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @book.complements.build
    # @book.guests.build
    # @book.book_comments.build
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' } if current_user.present?
        format.html { redirect_back(fallback_location: root_path, notice: 'Anotação salva com sucesso') } if not current_user.present?
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @pages = Dir.glob("vendor/uploads/books/#{@book.name}-*").count

    @pages.times do |i|
      FileUtils.rm("vendor/uploads/books/#{@book.name}-#{i}.jpg")
    end

    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def read
    @book = Book.find_by_url(params[:url])

    @pages = Dir.glob("vendor/uploads/books/#{@book.name}-*").count

    render layout: "book"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:url, :name, :file, :school_id, :complements_attributes => [:name, :file, :id, :_destroy], :guests_attributes => [:name, :classy, :groupy, :school_id, :code, :authenticated, :id, :_destroy], :book_comments_attributes => [:comment, :guest_id, :book_id, :_destroy, :id])
    end
end
