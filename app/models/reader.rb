class Reader < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :school
  has_one :book_list, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  accepts_nested_attributes_for :book_list, allow_destroy: false
  accepts_nested_attributes_for :book_comments, allow_destroy: true, reject_if: :all_blank

  after_create :set_code_as_authenticated, :define_school, :create_book_list

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

  def create_book_list
    book_list = BookList.new(reader_id: self.id)
    book = Guest.find_by_code(self.sign_up_code).book_id

    book_list.books = [book]
    book_list.save
  end
end
