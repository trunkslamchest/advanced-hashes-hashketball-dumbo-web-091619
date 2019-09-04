# WARNING: MESSY CODE. WILL CLEAN UP AND REFACTOR WHEN POSSIBLE. #
def game_hash
hash = {
	:home => {
			:team_name => "Brooklyn Nets",
			:colors => ["Black", "White"],
			:players => [
				{"Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}},
				{"Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7}},
				{"Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15}},
				{"Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5}},
				{"Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}}
				]
			},
	:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise", "Purple"],
			:players => [
				{"Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2}},
				{"Bismack Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10}},
				{"DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5}},
				{"Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0}},
				{"Kemba Walker" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}}
				]
			}
	}

	return hash
end

#
#
#
# WARNING: MESSY CODE BELOW. WILL CLEAN UP AND REFACTOR. #
#
#
#

def num_points_scored(player_name)
	val1 = game_hash.reduce(player_name) { |x, (y, z)|
		val2 = z.values[2].reduce(0) { |x2, y2|
			y2.select { |k, v|
				if k == player_name
					return v[:points]
				end
			}
		}
	}
end

def shoe_size(player_name)
	val1 = game_hash.reduce(player_name) { |x, (y, z)|
		val2 = z.values[2].reduce(0) { |x2, y2|
			y2.select { |k, v|
				if k == player_name
					return v[:shoe]
				end
			}
		}
	}
end

def team_colors(team_name)
	val1 = game_hash.reduce(team_name) { |x, (y, z) |
		z.select {|k, v|
			if v == team_name
				return z.values_at(:colors).flatten
			end
		 }
	}
end

def team_names
arr = []
	val1 = game_hash.reduce([]) { |x, (y, z)|
		z.select { |k, v| arr << z[:team_name] }
	}
return arr.uniq
end

def player_numbers(team_name)
arr = []

val1 = game_hash.reduce([]) { |x, (y, z) |

val3 = z[:team_name]

	val2 = z.reduce([]) { |x2, (y2, z2)|
		x2 = z2
	x2
	}
		val2.reduce([]) { |x3, y3|

			y3.values.each { |e|
				if val3 == team_name
					arr << e[:number]
				end
			}
		}

x = arr.sort
x
}
return val1
end

def player_stats(player_name)
	game_hash.reduce({}) { |x, (y, z)|
		val1 = z[:players].select { |k, v|
		if k.keys[0] == player_name
			return k.values_at(player_name)[0]
		end
		}
	}
end

def big_shoe_rebounds
shoe_arr = []
	game_hash.reduce({}) { |x, (y, z)|
		z[:players].select { |k|
				k.values.select { |k2|
					shoe_arr << k2[:shoe]
				}
		}
		z[:players].select { |k3|
			k3.values.select { |k4|
				if k4[:shoe] == shoe_arr.sort[-1]
					return k4[:rebounds]
				end
			}
		}
	}
end