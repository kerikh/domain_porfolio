class UserDomain < ActiveRecord::Base
  belongs_to :user
  belongs_to :domain_name

end
