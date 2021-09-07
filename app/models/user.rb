class User < ApplicationRecord
  belongs_to :role
  belongs_to :colaborador

  has_secure_password
  before_save :downcase_email

  private
  def downcase_email
    self.email.downcase!
  end
end
