class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= Admin.new # guest user (not logged in)
      if user.role=='Admin'
        can :manage, :all
        cannot :edit, :shop
        cannot :create, :product
      elsif user.role=='ShopOwner'
        can :manage, AssistantsController
        can :manage, Shop, :id => user.shop_id 
        can :manage, Product, :shop_id => user.shop_id 
        can :manage, Property do |property|
          user.shop.products.include?(property.product)
        end
        can :manage, OrderItem do |orderitem|
          user.shop.products.include?(orderitem.property.product)
        end
        cannot :delete, OrderItem
      else 
        can :update, :product
      end
  end
end
