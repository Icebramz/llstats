class Game < ActiveRecord::Base
 belongs_to :team
 belongs_to :hometeam, class_name: "Team"
 belongs_to :awayteam, class_name: "Team"

end
