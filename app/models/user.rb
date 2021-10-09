class User < ApplicationRecord
  has_secure_password
belongs_to :role


  alias_attribute :passwordConfirmation, :password_confirmation

  before_save :downcase_email
  validates_presence_of :email,:username,:role_id,:createBy
  validates_uniqueness_of :email, :message=> "EL valor insertado ya existe, campo unico correo "
  validates_uniqueness_of :username, :message=> "EL valor insertado ya existe, campo unico  username"

  validates :password, presence: true, length: {minimum: 8}
  private

  def downcase_email
    self.email.downcase!
  end

end
