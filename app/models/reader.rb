class Reader < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :school

  after_create :set_code_as_authenticated, :define_school

  validates :sign_up_code, on: :create, presence: true, inclusion: { in: proc { Guest.where( authenticated: false ).map( &:code ) } }

  def define_school
    guest_book = Guest.find_by_code(self.sign_up_code).book_id
    book = Book.find_by_id(guest_book)
    self.school_id = book.school_id
    self.save
  end

  def set_code_as_authenticated
    guest = Guest.find_by_code(self.sign_up_code)
    guest.authenticated = true
    guest.save
  end
end
