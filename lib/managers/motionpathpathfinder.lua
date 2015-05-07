MotionPathPathFinder = MotionPathPathFinder or class()
MotionPathPathFinder._VERSION = 0.1
function MotionPathPathFinder:init()
	self:recreate_graph()
end
function MotionPathPathFinder:recreate_graph()
	self._nodes = {}
	self._graph_units = {}
	for _, path in ipairs(managers.motion_path._paths) do
		if path.path_type == "ground" then
			self:_add_path(path)
		end
	end
	self._graph_units = {}
end
function MotionPathPathFinder:_make_link(current_pos, target_marker_index, path)
	local link
	local target_marker = path.markers[target_marker_index]
	if target_marker then
		local target_unit = self:_get_mop_marker_data(target_marker)
		local pos = target_unit.position
		local distance = mvector3.distance(current_pos, pos)
		link = {target_marker = target_marker, distance = distance}
	end
	return link
end
function MotionPathPathFinder:_add_path(path)
	local point_index = 1
	local last_marker, current_unit, current_pos
	for i_marker = 1, #path.markers do
		local current_marker = path.markers[i_marker]
		local current_unit = self:_get_mop_marker_data(current_marker)
		if not current_unit then
			return
		end
		local current_pos = current_unit.position
		local links = {}
		table.insert(links, self:_make_link(current_pos, i_marker + 1, path))
		table.insert(links, self:_make_link(current_pos, i_marker - 1, path))
		for _, bridge in ipairs(path.bridges) do
			if not bridge.disabled and bridge.marker_from == current_marker then
				local link = {
					target_marker = bridge.marker_to,
					distance = bridge.distance
				}
				table.insert(links, link)
			end
		end
		local node = {
			path = path,
			marker = current_marker,
			links = links,
			pos = current_pos
		}
		self._nodes[current_marker] = node
	end
end
function MotionPathPathFinder:_get_unit(unit_id)
	local unit = self._graph_units[unit_id]
	if not unit then
		if Application:editor() then
			unit = managers.editor:unit_with_id(unit_id)
		else
			unit = managers.worlddefinition:get_unit(unit_id)
		end
		self._graph_units[unit_id] = unit
	end
	return unit
end
function MotionPathPathFinder:_get_mop_marker_data(unit_id)
	local unit = managers.mission:get_element_by_id(unit_id)
	if unit then
		return unit._values
	end
	return unit
end
function MotionPathPathFinder:find_path(start_pos, end_pos)
	self._graph_units = {}
	local path_to_target = self:_astar_search(start_pos, end_pos)
	if not path_to_target then
		return nil
	end
	local path = path_to_target[1].path
	for _, node in ipairs(path_to_target) do
		if node.path ~= path then
			path = node.path
		else
		end
	end
	return path
end
function MotionPathPathFinder:_astar_search(start_pos, end_pos)
	local start_node, end_node = self:_find_nodes(start_pos, end_pos)
	if not start_node or not end_node then
		return nil
	end
	if start_node == end_node then
		return {start_node}
	end
	local open_nodes = {}
	local closed_nodes = {}
	local search_node = {
		node = start_node,
		g_score = 0,
		heuristic = mvector3.distance(start_node.pos, end_pos),
		came_from = nil
	}
	open_nodes[start_node.marker] = search_node
	local g_score = 0
	local iteration = 1
	while next(open_nodes) ~= nil do
		local best_node = self:_get_best_node(open_nodes)
		if best_node.node.marker == end_node.marker then
			local backtrack_path = {}
			local current_node = best_node
			repeat
				table.insert(backtrack_path, current_node)
				current_node = current_node.came_from
			until not current_node
			self._backtrack_path = backtrack_path
			local path = {}
			for i = #backtrack_path, 1, -1 do
				table.insert(path, backtrack_path[i].node)
			end
			self._open_nodes = open_nodes
			self._closed_nodes = closed_nodes
			return path
		end
		open_nodes[best_node.node.marker] = nil
		closed_nodes[best_node.node.marker] = best_node
		for _, link in ipairs(best_node.node.links) do
			if not closed_nodes[link.target_marker] then
				local distance = link.distance or 0
				local g_score = best_node.g_score + distance
				local node_in_open = open_nodes[link.target_marker]
				if not node_in_open then
					local target_node = self._nodes[link.target_marker]
					if target_node then
						local new_node = {
							node = target_node,
							g_score = g_score,
							heuristic = mvector3.distance(target_node.pos, end_pos),
							came_from = best_node
						}
						open_nodes[link.target_marker] = new_node
					else
						Application:error("A* failed, link doesn't have a target marker  - ", inspect(link))
						return
					end
				elseif g_score < node_in_open.g_score then
					node_in_open.g_score = g_score
					node_in_open.came_from = best_node
				end
			end
		end
		iteration = iteration + 1
	end
	return nil
end
function MotionPathPathFinder:_find_nodes(start_pos, end_pos)
	if not start_pos or not end_pos then
		return nil, nil
	end
	local start_node = {distance = 100000000, node = nil}
	local end_node = {distance = 100000000, node = nil}
	for marker, node in pairs(self._nodes) do
		local start_distance = mvector3.distance(start_pos, node.pos)
		if start_distance < start_node.distance then
			start_node.distance = start_distance
			start_node.node = node
		end
		local end_distance = mvector3.distance(end_pos, node.pos)
		if end_distance < end_node.distance then
			end_node.distance = end_distance
			end_node.node = node
		end
	end
	return start_node.node, end_node.node
end
function MotionPathPathFinder:_get_best_node(open_nodes)
	local best_node = {heuristic = 100000000, node = nil}
	for marker, node in pairs(open_nodes) do
		if node.heuristic < best_node.heuristic then
			best_node.heuristic = node.heuristic
			best_node.node = node
		end
	end
	return best_node.node
end
