class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  layout "users"

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @book.complements.build
    @book.guests.build
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
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
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
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_access_cards
    quantity = params[:quantity].to_i
    book = Book.find_by_id(params[:book_id].to_i)

    quantity.times do |x|
      a = book.guests.new

      until a.valid?
        a.code = generate_code()
      end

      a.save
    end

    respond_to do |format|
      format.html { redirect_to book, notice: "#{quantity} códigos gerados com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:url, :name, :file, :complements_attributes => [:name, :file, :id, :_destroy], :guests_attributes => [:name, :classy, :groupy, :school_id, :code, :authenticated, :id, :_destroy])
    end
end
