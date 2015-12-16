class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Callbacks
  before_create :set_default_role

  # Validations
  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create

  enum role_id: [:admin, :guest]

  def full_name
    self.first_name+" "+self.last_name
  end

  private

  def set_default_role
    self.role_id = 1 # Role Id for Guest
  end

end
