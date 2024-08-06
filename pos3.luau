local pos3 = {}

export type pos3 = {
	_type: "pos3",
	origin: Vector3,
	target: Vector3,
	direction: Vector3,
	diff: number,
}

-- deserialize a vector3 object
local function deserializeVector3(str: string): Vector3
	local parts = string.split(str, ",")
	return Vector3.new(tonumber(parts[1]), tonumber(parts[2]), tonumber(parts[3]))
end

-- Create a new pos3 object
function pos3.new(origin: Vector3, target: Vector3): pos3
	local diff = (target - origin)
	return {
		_type = "pos3",
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
	return str
end

-- deserialize a pos3 object
function pos3.deserialize(str: string): pos3
	local parts = string.split(str, "_")
	local origin = deserializeVector3(parts[2])
	local target = deserializeVector3(parts[3])
	return pos3.new(origin, target)
end

return pos3
