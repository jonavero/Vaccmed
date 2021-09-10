class User < ApplicationRecord
  has_secure_password

  belongs_to :role
  belongs_to :colaborador
  before_save :downcase_email
  validates_presence_of :email,:username,:colaborador_id,:role_id,:createBy
  validates_uniqueness_of :email,:username, :message=> "EL valor insertado ya existe, campo unico"
  validates :password_digest, presence: true, length: {minimum: 8}
  private

  def downcase_email
    self.email.downcase!
  end

end
