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



def num_points_scored(player_name)

	search = game_hash.reduce(0) { |memo, hash|

		player_stats = hash[1].values[2]

		player_stats.select { |player_names|
			catergories = player_names.values[0]

			if player_names.has_key?(player_name)
				memo = catergories[:points]
			end
		}

	memo
	}

return search
end



def shoe_size(player_name)

	search = game_hash.reduce(0) { |memo, hash|

		player_stats = hash[1].values[2]

		player_stats.select { |player_names|
			catergories = player_names.values[0]

			if player_names.has_key?(player_name)
				memo = catergories[:shoe]
			end
		}

	memo
	}

return search
end



def team_colors(team_name)

	search = game_hash.reduce([]) { |memo, hash|

	  team_stats = hash[1]

		team_stats.select {|catergories, value|

			if value == team_name
				memo = team_stats.values_at(:colors).flatten
			end
		 }

	memo
	}

return search
end



def team_names

	search = game_hash.reduce([]) { |memo, hash|

		team_stats = hash[1]

		memo << team_stats[:team_name]

	memo.uniq
	}

return search
end



def player_numbers(team_name)

	search = game_hash.reduce([]) { |memo, hash|

		team_stats = hash[1]
		player_stats = team_stats[:players]

		player_stats.each { |players|

		  player_stat_cat = players.values[0]

			if team_stats[:team_name] == team_name
				memo << player_stat_cat[:number]
			end
		}

	memo
	}

return search
end



def player_stats(player_name)

	search = game_hash.reduce({}) { |memo, hash|

		team_stats = hash[1]
		player_stats = team_stats[:players]

		player_stats.select { |players|

			name = players.keys[0]
			single_player_stats = players.values_at(player_name)[0]

			if name == player_name
				memo = single_player_stats
			end
		}

	memo
	}

return search
end



def big_shoe_rebounds

	search = game_hash.reduce([]) { |memo, hash|

		team_stats = hash[1]
		player_stats = team_stats[:players]

		player_stats.select { |players|

			player_stat_cat = players.values[0]

			memo << player_stat_cat[:shoe]

		}

		player_stats.select { |players|

			player_stat_cat = players.values[0]

			if player_stat_cat[:shoe] == memo.sort[-1]
				return (player_stat_cat[:rebounds])
			end
		}

	memo
	}

return search
end



def most_points_scored

	parse = game_hash.reduce([]) { |arr, hash|

		player_stats = hash[1][:players]

		player_stats.select { |players|

			stats = players.values[0]

			arr << stats[:points]

		}

	arr
	}

	search = game_hash.reduce("") { |str, hash|

		player_stats = hash[1][:players]

		player_stats.select { |players|

			most_points = parse.sort[-1]
			stats = players.values[0]
			name = players.keys[0]

			if most_points == stats[:points]
				str = name
			end
		}

	str
	}

return search
end



def winning_team

	score = game_hash.reduce({}) { |memo, hash|

		player_stats = hash[1][:players]
		teams = hash[1][:team_name]
		total = 0

		player_stats.select { |players|

			stats = players.values[0]

			total += stats[:points]
		}

		memo[teams] = total

	memo
	}

	home_team_name = score.keys[0]
	away_team_name = score.keys[1]

	home_team_score = score.values[0]
	away_team_score = score.values[1]

return home_team_score > away_team_score ? home_team_name : away_team_name
end



def player_with_longest_name

	search = game_hash.reduce({}) { |memo, hash|

		player_stats = hash[1][:players]

		player_stats.each { |players|

			name = players.keys[0]
			name_length = players.keys[0].length

			memo[name] = name_length
		}

	memo
	}

	sorted = search.sort_by {|key, value| value }
	longest_name = sorted[-1][0]

return longest_name
end



def long_name_steals_a_ton?

	search_names = game_hash.reduce({}) { |memo, hash|

		player_stats = hash[1][:players]

		player_stats.each { |players|

			name = players.keys[0]
			name_length = players.keys[0].length

			memo[name] = name_length
		}

	memo
	}

	search_steals = game_hash.reduce({}) { |memo, hash|

		player_stats = hash[1][:players]

		player_stats.each { |players|

			name = players.keys[0]
			players.values[0][:steals]
			num_steals = players.values[0][:steals]

			memo[name] = num_steals
		}

	memo
	}

	sorted_names = search_names.sort_by {|key, value| value }
	sorted_steals = search_steals.sort_by {|key, value| value }

	longest_name = sorted_names[-1][0]
	most_steals = sorted_steals[-1][0]

return most_steals == longest_name
end