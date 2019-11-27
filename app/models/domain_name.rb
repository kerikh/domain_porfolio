class DomainName < ActiveRecord::Base

  validates :domain_name, :user_id, presence: true, uniqueness: true
  belongs_to :user, class_name: "user", foreign_key: "user_id"
  belongs_to :service, class_name: "service", foreign_key: "service_id"
end
