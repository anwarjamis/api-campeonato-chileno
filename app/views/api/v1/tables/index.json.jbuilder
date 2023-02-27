json.array! @tables do |table|
  json.extract! table, :position, :club, :points, :played, :won, :drawn, :lost, :gf, :ga, :gd
end
