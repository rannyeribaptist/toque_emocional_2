class GuestsController < ApplicationController
  # before_action :ensure_account_presence
  before_action :set_guest, only: [:edit, :update, :destroy]

  layout "users"

  def index
    redirect_to "/" if not params[:book_id]

    @book = Book.find_by_id(params[:book_id])
    @guests = Guest.where(book_id: @book.id).paginate(page: params[:page]) if params[:book_id]
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url(book_id: @book.id), notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_access_cards
    @quantity = params[:quantity].to_i
    @book = Book.find_by_id(params[:book_id].to_i)

    @quantity.times do |x|
      a = Guest.new(book_id: @book.id, authenticated: false)

      until a.valid?
        a.code = generate_code()
      end

      puts a.inspect

      a.save
    end

    respond_to do |format|
      format.html { redirect_to(controller: "guests", action: "print_access_cards", book_id: @book.id, quantity: @quantity) }
      # format.html { redirect_to guests_url(book_id: @book.id), notice: "#{@quantity} códigos gerados com sucesso." }
      format.json { head :no_content }
    end
  end

  def print_access_cards
    require 'rqrcode'

    @book = Book.find_by_id(params[:book_id])

    @qr = RQRCode::QRCode.new( 'https://toqueemocional.com.br/livro/' + @book.url)
    @png = @qr.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 100,
          border_modules: 4,
          module_px_size: 6,
          file: nil # path to write
          )

    if (params[:quantity].present? and params[:book_id].present?)
      @guests = Guest.last(params[:quantity])
    else
      redirect_back(fallback_location: '/', :notice => "Preciso saber quantos cartões você quer imprimir...")
    end

    render layout: "printing_layout"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
      @book = Book.find_by_id(@guest.book_id)
    end

    def ensure_account_presence
      # redirect_to :home if not current_user.present or not current_guest.present
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:code, :authenticated, :book_id)
    end
end
