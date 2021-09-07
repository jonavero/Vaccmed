class User < ApplicationRecord
  has_secure_password

  belongs_to :role
  belongs_to :colaborador
  before_save :downcase_email
  validates_presence_of :email,:username,:password_digest,:colaborador_id,:role_id,:createBy
  validates_uniqueness_of :email,:username
  private
  def downcase_email
    self.email.downcase!
  end
end
