local function solution(filename)
	local deers = {}
	for line in io.lines(filename) do
		local speed, duration, rest = line:match("%a+ can fly (%d+) km/s for (%d+) seconds, but then must rest for (%d+) seconds.")
			deers[#deers+1] = {
				speed = speed,
				max_stamina = duration,
				stamina_counter = duration,
				max_rest = rest,
				rest_counter = rest,
				is_running = true,
				distance = 0,
				points = 0,
			}
	end
	for _ = 1, 2503 do
		for _, deer in ipairs(deers) do
			if deer.is_running then
				deer.distance = deer.distance + deer.speed
				deer.stamina_counter = deer.stamina_counter - 1
				if deer.stamina_counter == 0 then
					deer.is_running = false
					deer.stamina_counter = deer.max_stamina
				end
			else
				deer.rest_counter = deer.rest_counter - 1
				if deer.rest_counter == 0 then
					deer.rest_counter = deer.max_rest
					deer.is_running = true
				end
			end
		end
		table.sort(deers, function (a, b)
			return a.distance > b.distance and true or false
		end)
		local in_lead = deers[1].distance
		for _, deer in ipairs(deers) do
			if deer.distance == in_lead then
				deer.points = deer.points + 1
			end
		end
	end
	local higest_distance, highest_points = 0, 0
	for _, deer in ipairs(deers) do
		if higest_distance < deer.distance then
			higest_distance = deer.distance
		end
		if highest_points < deer.points then
			highest_points = deer.points
		end
	end
	return higest_distance, highest_points
end

print(solution("day14.txt"))
