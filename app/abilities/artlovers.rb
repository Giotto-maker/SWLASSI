Canard::Abilities.for(:artlover) do
  # Define abilities for the user role here. For example:
  #
  #   if user.admin?
  #     can :manage, :all
  #   else
  #     can :read, :all
  #   end
  #
  # The first argument to `can` is the action you are giving the user permission to do.
  # If you pass :manage it will apply to every action. Other common actions here are
  # :read, :create, :update and :destroy.
  #
  # The second argument is the resource the user can perform the action on. If you pass
  # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
  #
  # The third argument is an optional hash of conditions to further filter the objects.
  # For example, here the user can only update published articles.
  #
  #   can :update, Article, published: true
  #
  # See the wiki for details: https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

  can [:read], Artwork
  can :create_artwork_with_lover_permission, Artwork
  can :require_additional_infos, Artwork
  can :look_for_artwork, Artwork
  
  cannot :create_artwork_with_admin_permission, Artwork
  cannot [:destroy, :update], Artwork
  
  
  cannot [:read,:destroy], Review
  can [:create, :update], Review
end
