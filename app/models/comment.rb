class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  

  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes[:username].blank? }

  # def user_id=(name)
  #   self.user = User.find_or_create_by(username: name)
  # end

  # def user_id
  #    self.user ? self.user.username : nil
  # end



end
