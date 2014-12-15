class PoemCategory < ActiveRecord::Base
  belongs_to :poem
  belongs_to :category
end
