class User < ActiveRecord::Base
  
  include GlobalMethods
	
  # relations
  has_many :authentications
  has_one :profile
  has_many :insurances
  
  after_create :set_default_associations

  # validations
  validates :first_name, :last_name, :presence => true
  # validates :username, :uniqueness => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :image, :username

  def apply_omniauth omniauth
  	authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
  	(authentications.empty? || !password.blank?) && super
  end

  def set_default_associations
 
    # Plan.all.each do |p|
    #   self.insurances.create( :plan_id => p.id, :carrier_name => 'Carrier name', :plan_name => 'Plan name', :policy_number => '3hjg3434ff4y3', :start_date => "#{ rand(31) + 1 }-#{ rand(12) + 1 }-2012", :renewal_date => "#{ rand(31) + 1 }-#{ rand(12) + 1 }-2013", :annual_premium => rand(45), :comment => 'test comment goes here' )
    # end
  end

  def total_annual_insurance
    tot_ins = self.insurances.map{ |i| i.annual_premium.to_f }.sum
    tot_ins = "%0.2f" % tot_ins
  end
  
end
