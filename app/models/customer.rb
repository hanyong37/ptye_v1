class Customer < ActiveRecord::Base
  has_many :user_activities
  default_scope {order('is_member desc, name')}

  validates :name,presence: true
  def balance
    total_charge = self.user_activities.where(act_type: '0').sum(:amount)

    total_spend = self.user_activities.where(act_type: '1').sum(:amount)
    total_charge - total_spend
  end
end
