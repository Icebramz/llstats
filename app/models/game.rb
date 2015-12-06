class Game < ActiveRecord::Base
 belongs_to :team
 belongs_to :hometeam, class_name: "Team"
 belongs_to :awayteam, class_name: "Team"
 before_save :calcscore
 has_many :plays, dependent: :destroy


 def calcscore
 	self.home_runs = self.home_inningone + self.home_inningtwo + self.home_inningthree + self.home_inningfour + self.home_inningfive + self.home_inningsix + self.home_inningseven + self.home_inningeight + self.home_inningnine
 	self.away_runs = self.away_inningone + self.away_inningtwo + self.away_inningthree + self.away_inningfour + self.away_inningfive + self.away_inningsix + self.away_inningseven + self.away_inningeight + self.away_inningnine
 end

end
