class Service < ActiveRecord::Base

  validates :service_name, :user_id, presence: true

  has_many :domain_names
  belongs_to :user, class_name: "user", foreign_key: "user_id"



  private

end
