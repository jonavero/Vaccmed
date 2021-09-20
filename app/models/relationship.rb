class Relationship < ApplicationRecord
has_many :dependents

  VALIDATE_RELATION=['Padre','Madre','Abuelo', 'Abuela','Tio','Tia','Padrastro','Madrastra','Hermano','Hermana']
  validates :name,inclusion: {in:VALIDATE_RELATION}
  validates :name, :uniqueness => true
  validates :name, presence: true
end
