module CommunitiesHelper



  def first_one_here?
    Community.where(community_zip: current_user.zip_code).count < 1
  end


def in_this_community?
	@user.community_id == @community.id
end

def all_alone?
	User.where(community_id: @community.id ).count == 1
end











	
end