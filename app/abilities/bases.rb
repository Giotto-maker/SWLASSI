Canard::Abilities.for(:base) do
  can [:read], Artwork
  can :create_artwork_with_user_permission, Artwork
  cannot :create_artwork_with_admin_permission, Artwork
  cannot [:destroy, :update], Artwork
  cannot :require_additional_infos, Artwork
  cannot :look_for_artwork, Artwork
  
  cannot [:read,:destroy], Review
  can [:create, :update], Review

  
  
end
