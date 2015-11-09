class Team < ActiveRecord::Base
 
 has_many :players, dependent: :destroy

 validates :name, presence: true, format: {with: /\A[a-zA-Z\s]+\z/, message: "Only Letters are allowed"}
 validates :division, presence: true, numericality: {greater_than_or_equal_to: 0}

 has_attached_file :avatar,
    :styles => {
      :large =>"500x500>",
      :medium => "300x300>",
      :preview  => ['480x480#',  :jpg, :quality => 70],
      :thumb => "200x200>" },
    :url => "/:class/:attachment/:id/:style_:basename.:extension"
  
  validates_attachment :avatar, 
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] },
      :size => { :in => 0..20.megabytes } 



end
