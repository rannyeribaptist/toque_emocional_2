class Book < ApplicationRecord
  has_many :pages

  validates_presence_of :url, :name, :file

  validate :check_for_pages

  def check_for_pages
    # when creating a new contact: making sure at least one team exists
    return errors.add :base, "Alguma coisa aconteceu e não foi possível processar as páginas desse livro..." unless pages.length > 0

    # when updating an existing contact: Making sure that at least one team would exist
    return errors.add :base, "Alguma coisa aconteceu e não foi possível processar as páginas desse livro..." if pages.reject{|page| page._destroy == true}.empty?
  end
end
