class BookCommentsController < ApplicationController
  def new_book_comments
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_back(fallback_location: root_path, notice: 'Anotação salva com sucesso') }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy_book_comments
    @comment = BookComment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: 'Anotação excluída') }
      format.json { head :no_content }
    end
  end
end
