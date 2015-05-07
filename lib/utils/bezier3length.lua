local hypot = require("lib/utils/Bezier3Point").hypot
local abs = math.abs
local abscissae = {
	-0.064056896,
	0.064056896,
	-0.19111887,
	0.19111887,
	-0.31504267,
	0.31504267,
	-0.43379351,
	0.43379351,
	-0.5454215,
	0.5454215,
	-0.64809364,
	0.64809364,
	-0.74012417,
	0.74012417,
	-0.82000196,
	0.82000196,
	-0.88641554,
	0.88641554,
	-0.93827456,
	0.93827456,
	-0.9747286,
	0.9747286,
	-0.9951872,
	0.9951872
}
local weights = {
	0.1279382,
	0.1279382,
	0.12583746,
	0.12583746,
	0.12167047,
	0.12167047,
	0.115505666,
	0.115505666,
	0.10744427,
	0.10744427,
	0.097618654,
	0.097618654,
	0.086190164,
	0.086190164,
	0.07334648,
	0.07334648,
	0.059298586,
	0.059298586,
	0.044277437,
	0.044277437,
	0.02853139,
	0.02853139,
	0.01234123,
	0.01234123
}
local function length_function(coefficients, derivative1_for)
	return function(t, x1, y1, x2, y2, x3, y3, x4, y4)
		local ax, bx, cx = coefficients(x1, x2, x3, x4)
		local ay, by, cy = coefficients(y1, y2, y3, y4)
		local z2 = t / 2
		local sum = 0
		for i = 1, #abscissae do
			local corrected_t = z2 * abscissae[i] + z2
			local dx = derivative1_for(corrected_t, ax, bx, cx)
			local dy = derivative1_for(corrected_t, ay, by, cy)
			sum = sum + weights[i] * hypot(dx, dy)
		end
		return z2 * sum
	end
end
return length_function
