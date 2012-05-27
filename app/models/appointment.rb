
class CustomerValidator < ActiveModel::Validator 
  def validate(record)
    if record.customer_id == 0 and !record.custname
      record.errors[:base] << "No customer information given"
    end
  end
end

class Appointment < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :product
  before_save :copy_customer_name 
  before_save :check_schedule  
  
  attr_accessible :app_date, :app_time, :confirmed, :custname, 
                  :customer_id, :email, :notes, 
                  :telephone

  validates_with CustomerValidator
  validates_presence_of :app_date
  validates_presence_of :app_time
  validates_presence_of :product_id
  
  def to_block
   convert_time_to_block(self.app_time)
  end
  
  def check_schedule
    true
  end
  
  def employee
    calendar.employee
  end
  
  def copy_customer_name
    if self.customer_id > 0
      self.custname = Customer.find(self.customer_id).name
    end
  end
end
