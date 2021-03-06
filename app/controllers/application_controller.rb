class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|

redirect_to root_url, :alert => exception.message
  end

  protect_from_forgery :except => :managers
  before_filter :authenticate_user!
  skip_before_filter :authenticate_user!, :only => :managers

  def after_sign_in_path_for(resource)
    if current_organization != nil
      if resource && resource.sign_in_count == 1
        edit_user_path(resource)
      elsif resource
          leaves_path
      end
    end
  end

  def after_invite_path_for(resource)
    user = resource
    l_t = params[:leave_type]
    pay = params[:pay_role]
    if params[:user][:pay_role] == "1"
      @leave_types = current_organization.leave_types.where(:id => l_t)
    else
      @leave_types = current_organization.leave_types.all
    end
    assign_leaves =calculate_leaves
    total_leave = complete_leaves
    user.leave_details.build
    user.leave_details.last.assign_date = Date.today
    if params[:user][:join_date].to_date.year == Date.today.year
    user.leave_details.last.assign_leaves = assign_leaves
    user.leave_details.last.available_leaves = assign_leaves
    else
      user.leave_details.last.assign_leaves = total_leave
      user.leave_details.last.available_leaves = total_leave
    end
    user.leave_details.last.save
    users_path
  end

  def calculate_leaves
    start_date = Time.zone.now.to_date
    end_date = Time.zone.now.end_of_year.to_date
    months = end_date.month - start_date.month
    assign_leaves = {}
    @leave_types.each do |lt|
      if lt.auto_increament == true
        num_leaves = lt.number_of_leaves
      else
        num_leaves = (lt.max_no_of_leaves/12.0*months).round(0)
      end
      assign_leaves[lt.id] = num_leaves
    end
    return assign_leaves
  end
  def complete_leaves
    total_leaves = {}
    @leave_types.each do |lt|
        if lt.auto_increament == true
          hold_leaves = lt.number_of_leaves
        else
        hold_leaves = lt.max_no_of_leaves
      end
      total_leaves[lt.id] = hold_leaves
    end
return total_leaves
  end

  def current_organization
    if extract_subdomain != nil
      @current_organization = Organization.find_by_slug!( extract_subdomain )
      # make sure we can only access the current users account!
      if @current_organization != nil && current_user != nil && current_user.organization == @current_organization
        return @current_organization
      else
        sign_out
        return nil
      end
    else
      return nil
    end
  end
  helper_method :current_organization

	private

  def extract_subdomain
    subdomain = request.subdomains.first
    if subdomain == "www" 
      subdomain = request.subdomains.last
    end
    return subdomain
  end

  def authenticate_inviter!
    unless current_user.roles == 'Admin'
      redirect_to root_url, :alert => "You are not authorized to access this page."
    end
    super
  end


end
	
