class Santa < ActiveRecord::Base
  has_one :gift, dependent: :destroy
end
