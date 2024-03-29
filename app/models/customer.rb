class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validate :check_for_main_employee
  validates_presence_of :email
  validates_numericality_of :telephone, :on => :create, :message => "is not a number"
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def myEmployee
    self.employee_id
  end

  def myEmployee=(employee)
    self.employee_id = employee
  end
end
