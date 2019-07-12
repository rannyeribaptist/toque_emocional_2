class ReadersController < ApplicationController
  before_action :set_reader, only: [:show, :edit, :update, :destroy]
  before_action :set_reader_for_book_comments, only: [:update_book_comments, :update_comments_list]

  # GET /readers
  # GET /readers.json
  def index
    @readers = Reader.all
  end

  # GET /readers/1
  # GET /readers/1.json
  def show
  end

  # GET /readers/new
  def new
    @reader = Reader.new
    @reader.build_book_list
    @reader.book_comments.build
  end

  # GET /readers/1/edit
  def edit
  end

  # POST /readers
  # POST /readers.json
  def create
    @reader = Reader.new(reader_params)

    respond_to do |format|
      if @reader.save
        format.html { redirect_to @reader, notice: 'Reader was successfully created.' }
        format.json { render :show, status: :created, location: @reader }
      else
        format.html { render :new }
        format.json { render json: @reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readers/1
  # PATCH/PUT /readers/1.json
  def update
    respond_to do |format|
      if @reader.update(reader_params)
        format.html { redirect_to @reader, notice: 'Reader was successfully updated.' }
        format.json { render :show, status: :ok, location: @reader }
      else
        format.html { render :edit }
        format.json { render json: @reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readers/1
  # DELETE /readers/1.json
  def destroy
    @reader.destroy
    respond_to do |format|
      format.html { redirect_to readers_url, notice: 'Reader was successfully destroyed.' }
      format.js { render 'books/update_comments'}
      format.json { head :no_content }
    end
  end

  def update_book_comments
    respond_to do |format|
      if @reader.update(reader_params)
        format.js { render 'books/update_comments', status: :ok, locals: {:book => @book, :current_page => params["reader"]["book_comments_attributes"]["0"]["page"]} }
      else
        format.js { render 'books/update_comments', status: :unprocessable_entity }
      end
    end
  end

  def delete_book_comments
    @comment = BookComment.find(params[:id])
    @book = Book.find(@comment.book_id)
    @comment.destroy

    respond_to do |format|
      format.js { render 'books/update_comments', locals: {:book => @book} }
    end
  end

  def validate_book_code
  end

  def add_book
    if Guest.where(authenticated: false, code: params[:code]).present?
      books = current_reader.book_list
      guest = Guest.find_by_code(params[:code])
      guest.authenticated = true

      books.books += [guest.book_id]
      books.save
      guest.save

      redirect_to "/livros", notice: "Sucesso!"
    else
      redirect_to validate_book_code_url, notice: "Este código é inválido!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reader
      @reader = Reader.find(params[:id])
    end

    def set_reader_for_book_comments
      @reader = Reader.find(params[:id])
      @book = Book.find(params[:reader][:book_comments_attributes]["0"][:book_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reader_params
      params.require(:reader).permit(:name, :classy, :groupy, :birthday, :school_id, :book_list_attributes => [:id, :books => []], :book_comments_attributes => [:id, :_destroy, :comment, :book_id, :page])
    end
end
