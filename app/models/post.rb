class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, :users, :comments

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end

  def users_attributes=(users_attributes)
    #binding.pry
    # if users_attributes.values[0][:username].empty? && users_attributes.values[0][:username].empty?
    #     user = User.find(users_attributes.values[0][:id])
    #     self.comments.last.user = user
    # else
    #     user = User.create(username: users_attributes.values[0][:username], email: users_attributes.values[0][:email])
    #     self.comments.last.user = user
    # end
    users_attributes.values.each do |user_attribute|
      #binding.pry
      user = User.find_or_create_by(user_attribute)
      #binding.pry
      self.comments.last.user = user
    end
  end
end
