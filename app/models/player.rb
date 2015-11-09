class Player < ActiveRecord::Base
  belongs_to :team
  before_save :calcstats

  def calcstats
#    self.batavg = self.hits.to_f / self.atbats
  end

end
