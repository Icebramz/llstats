class Team < ActiveRecord::Base
 
 belongs_to :user 

 has_many :players, dependent: :destroy

 validates :name, presence: true, format: {with: /\A[a-zA-Z]+\z/, message: "Only Letters are allowed"}
 validates :division, presence: true, numericality: {greater_than_or_equal_to: 0}



end
