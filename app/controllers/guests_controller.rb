class GuestsController < ApplicationController
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
end
