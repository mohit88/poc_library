class User < ActiveRecord::Base
  alias_attribute :role, :type
  module Role
    INTERN = "Intern"
    ADMIN = "Admin"
  end
end
