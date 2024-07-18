local pos3 = {}

export type pos3 = {
	type: "pos3",
	origin: Vector3,
	target: Vector3,
	direction: Vector3,
	diff: number,
}

-- deserialize a vector3 object
local function desieralizeVector3(str: string): Vector3
	local parts = string.split(str, ",")
	return Vector3.new(tonumber(parts[1]), tonumber(parts[2]), tonumber(parts[3]))
end

-- Create a new pos3 object
function pos3.new(origin: Vector3, target: Vector3): pos3
	local diff = (target - origin)
	return {
		type = "pos3",
		origin = origin,
		target = target,
		direction = diff.Unit,
		diff = diff.Magnitude,
	}
end

-- serialize a pos3 object
function pos3.serialize(pos3: pos3): string
	local str = "pos3_"
	str = str .. tostring(pos3.origin) .. "_"
	str = str .. tostring(pos3.target) .. "_"
	str = str .. tostring(pos3.direction) .. "_"
	str = str .. tostring(pos3.diff)
	return str
end

-- deserialize a pos3 object
function pos3.deserialize(str: string): pos3
	local parts = string.split(str, "_")
	return {
		type = "pos3",
		origin = desieralizeVector3(parts[2]),
		target = desieralizeVector3(parts[3]),
		direction = desieralizeVector3(parts[4]),
		diff = tonumber(parts[5]),
	}
end

return pos3
