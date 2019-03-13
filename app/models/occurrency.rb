class Occurrency < ApplicationRecord
  has_many :occurrency_students, dependent: :destroy

  validates_presence_of :description, :filled_by, :emotional_sphere
  accepts_nested_attributes_for :occurrency_students, reject_if: :all_blank, allow_destroy: true
  validate :check_for_students

  has_trash
  self.per_page = 10

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_school_id
    ]
  )

  scope :search_query, lambda { |query| where("description LIKE ? OR emotional_sphere LIKE ?", "%#{query}%", "%#{query}%") }
  scope :with_school_id, lambda { |school_id| where(:school_id => school_id) }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'

    case sort_option.to_s
    when /^created_at/
      order("LOWER(occurrencies.created_at) #{ direction }")
    else
      raise(ArgumentError, "Opção inválida: #{ sort_option.inspect }")
    end
  }

  def self.options_for_sorted_by
    [
      ['Data de Registro (novos primeiro)', 'created_at_desc'],
      ['Data de Registro (antigos primeiro)', 'created_at_asc']
    ]
  end

  def check_for_students
    # when creating a new contact: making sure at least one team exists
    return errors.add :base, "Você não adicionou nenhum estudante..." unless occurrency_students.length > 0

    # when updating an existing contact: Making sure that at least one team would exist
    return errors.add :base, "Deve haver pelo menos um estudante na ocorrência..." if occurrency_students.reject{|occurrency_student| occurrency_student._destroy == true}.empty?
  end
end
