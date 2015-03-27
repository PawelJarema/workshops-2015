class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  before_create :set_default_role

  has_many :reviews
  has_many :products
  has_one :profile

  validates_presence_of :firstname, :lastname

  def admin?
    role ? role.name == 'admin' : false
  end

  private
  def set_default_role
  	self.role ||= Role.find_by_name('registered')
  end

end
