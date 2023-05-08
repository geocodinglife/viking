module Roleable

  extend ActiveSupport::Concern
  included do
    # List user roles
    ROLES = [:superadmin, :admin, :customer]
  
    # json column to store roles 
    store_accessor :roles, *ROLES
  
    # Cast roles to/from booleans
    ROLES.each do |role|
      scope role, -> { where("roles @> ?", {role => true}.to_json) }
      define_method(:"#{role}=") { |value| super ActiveRecord::Type::Boolean.new.cast(value) }
      define_method(:"#{role}?") { send(role) }
    end
  
    def active_roles # Where value true
      ROLES.select { |role| send(:"#{role}?") }.compact
    end
  
    # role validation
    validate :must_have_a_role, on: :update
    validate :must_have_an_superadmin
  
    private
  
    def must_have_an_superadmin
      if persisted? &&
          (User.where.not(id: id).pluck(:roles).count { |h| h["superadmin"] == true } < 1) &&
          roles_changed? && superadmin == false
        errors.add(:base, "There should be at least one superadmin")
      end
    end
  
    def must_have_a_role
      if roles.values.none?
        errors.add(:base, "A user must have at least one role")
      end
    end
  end
end