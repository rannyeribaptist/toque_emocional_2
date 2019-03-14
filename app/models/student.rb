class Student < ApplicationRecord
  belongs_to :school
  has_many :occurrency_students
  has_many :appointment_students
  has_many :appointments

  has_trash
  validates_presence_of :name, :school, :classy, :groupy

  self.per_page = 10

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_school_id
    ]
  )

  scope :search_query, lambda { |query| where("name LIKE ? OR classy LIKE ? OR groupy LIKE ?", "%#{query}%","%#{query}%","%#{query}%") }
  scope :with_school_id, lambda { |school_id| where(:school_id => school_id) }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'

    case sort_option.to_s
    when /^name/
      order("LOWER(students.name) #{ direction }")
    when /^classy/
      order("LOWER(students.classy) #{ direction }")
    when /^group/
      order("LOWER(students.groupy) #{ direction }")
    when /^created_at/
      order("LOWER(students.created_at) #{ direction }")
    else
      raise(ArgumentError, "Opção inválida: #{ sort_option.inspect }")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nome (a-z)', 'name_asc'],
      ['Nome (z-a)', 'name_desc'],
      ['Ano (a-z)', 'classy_asc'],
      ['Ano (z-a)', 'classy_desc'],
      ['Turma (a-z)', 'groupy_asc'],
      ['Turma (z-a)', 'groupy_desc'],
      ['Data de Registro (novos primeiro)', 'created_at_desc'],
      ['Data de Registro (antigos primeiro)', 'created_at_asc']
    ]
  end

  def funky_method
    "#{self.name}, #{self.classy} #{self.groupy}"
  end
end
