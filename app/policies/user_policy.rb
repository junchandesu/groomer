class UserPolicy < ApplicationPolicy
	def role?
	  user.present? && user.admin?
    end
end