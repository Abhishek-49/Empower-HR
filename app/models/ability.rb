# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(employee)
    employee ||= Employee.new # guest user (not logged in)

    if employee.role&.superadmin == 'superadmin'
      can :manage, :all
    elsif employee.role&.admin == 'admin'
      can :manage, Leave
      can [:read, :update, :destroy], Employee
      can [:read, :update, :destroy], Role
      cannot :create, Employee
    else
      can :read, Employee
      can :update, Employee, id: employee.id
      can :create, Leave
      can :read, Leave, id: employee.id
    end
  end

  def permitted_attributes(employee)
    if employee.role&.superadmin == 'superadmin' || employee.role&.admin == 'admin'
      %i[first_name last_name department_id employee_id address mobile_no aadhar pancard date_of_birth role_id] # List of attributes for admin roles
    else
      %i[first_name last_name address mobile_no]
    end
  end

end
