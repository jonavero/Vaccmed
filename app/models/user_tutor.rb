class UserTutor < ApplicationRecord
  has_secure_password

  belongs_to :role
  belongs_to :tutor



  before_save :downcase_email
  validates_presence_of :email,:identityCard,:tutor_id,:createdBy
  validates_uniqueness_of :email,:identityCard, :message=> "EL valor insertado ya existe, campo unico"
  validates :password, presence: true, length: {minimum: 8}
  private

  def downcase_email
    self.email.downcase!
  end

end
