class Game < ActiveRecord::Base
 belongs_to :user
 #belongs_to :users, through: :teams
 # maybe don't need -> has_many :user_games
 #has_and_belongs_to_many :teams

 #belongs_to :team

 belongs_to :hometeam, class_name: "Team"
 belongs_to :awayteam, class_name: "Team"
 before_save :calcscore
 has_many :plays, dependent: :destroy

# validates :home_inningone, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :home_inningtwo, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :home_inningthree, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :home_inningfour, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :home_inningfive, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :home_inningsix, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :home_inningseven, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :home_inningeight, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :home_inningnine, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :home_hits, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :home_error, presence: true, numericality: {greater_than_or_equal_to: 0}

# validates :away_inningone, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :away_inningtwo, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :away_inningthree, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :away_inningfour, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :away_inningfive, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :away_inningsix, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :away_inningseven, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :away_inningeight, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :away_inningnine, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :away_hits, presence: true, numericality: {greater_than_or_equal_to: 0}
# validates :away_error, presence: true, numericality: {greater_than_or_equal_to: 0}

  
 def calcscore
  self.home_runs = 0
  self.away_runs = 0
  self.home_hits = 0
  self.away_hits = 0
  self.home_error = 0
  self.away_error = 0

  if self.home_inningone != nil
   self.home_runs += self.home_inningone
  end
  if self.home_inningtwo != nil
   self.home_runs += self.home_inningtwo
  end
  if self.home_inningthree != nil
   self.home_runs += self.home_inningthree
  end
  if self.home_inningfour != nil
   self.home_runs += self.home_inningfour
  end
  if self.home_inningfive != nil
   self.home_runs += self.home_inningfive
  end
  if self.home_inningsix != nil
   self.home_runs += self.home_inningsix
  end
  if self.home_inningseven != nil
   self.home_runs += self.home_inningseven
  end
  if self.home_inningeight != nil
   self.home_runs += self.home_inningeight
  end
  if self.home_inningnine != nil
   self.home_runs += self.home_inningnine
  end

  if self.away_inningone != nil
   self.away_runs += self.away_inningone
  end
  if self.away_inningtwo != nil
   self.away_runs += self.away_inningtwo
  end
  if self.away_inningthree != nil
   self.away_runs += self.away_inningthree
  end
  if self.away_inningfour != nil
   self.away_runs += self.away_inningfour
  end
  if self.away_inningfive != nil
   self.away_runs += self.away_inningfive
  end
  if self.away_inningsix != nil
   self.away_runs += self.away_inningsix
  end
  if self.away_inningseven != nil
   self.away_runs += self.away_inningseven
  end
  if self.away_inningeight != nil
   self.away_runs += self.away_inningeight
  end
  if self.away_inningnine != nil
   self.away_runs += self.away_inningnine
  end

      
 #	self.home_runs = self.home_inningone + self.home_inningtwo + self.home_inningthree + self.home_inningfour + self.home_inningfive + self.home_inningsix + self.home_inningseven + self.home_inningeight + self.home_inningnine
# 	self.away_runs = self.away_inningone + self.away_inningtwo + self.away_inningthree + self.away_inningfour + self.away_inningfive + self.away_inningsix + self.away_inningseven + self.away_inningeight + self.away_inningnine
 end

end
