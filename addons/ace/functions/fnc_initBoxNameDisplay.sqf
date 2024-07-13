params ["_display"];

private _paramStr = displayUniqueName _display;
(parseSimpleArray (_paramStr regexReplace ["\*", """"] regexReplace ["_\._", ","])) params ["_model", "_srcTex", "_text"];

(_display displayCtrl 1) ctrlSetText _srcTex; // Put original texture as background

#define PixelCoordToUV2048(x) (x/2048)
#define PixelCoords1024(x,y,w,h) (x/1024),(y/1024),(w/1024),(h/1024)
#define UVToArr(x1,y1,x2,y2) x1,y1,x2-x1,y2-y1

private _boxParams = [
	["plasticcase_01_large_f.p3d", {
		[
			// Twice on front (One is mirrored.. ugh)
			[PixelCoordToUV2048(292), PixelCoordToUV2048(978), PixelCoordToUV2048(280), PixelCoordToUV2048(333), 0.05],
			// Top twice, one mirrored..
			[PixelCoordToUV2048(503), PixelCoordToUV2048(1687), PixelCoordToUV2048(228), PixelCoordToUV2048(273), 0.04],
			// Twice back, mirrored
			[PixelCoordToUV2048(0), PixelCoordToUV2048(975), PixelCoordToUV2048(280), PixelCoordToUV2048(335), 0.05]
		]
	}],
	["plasticcase_01_medium_f.p3d", {
		[
			// Top twice, one mirrored..
			[PixelCoordToUV2048(1437), PixelCoordToUV2048(890), PixelCoordToUV2048(514), PixelCoordToUV2048(187), 0.08]
		]
	}],
	["plasticcase_01_small_f.p3d", {
		[
			// We use the sign selection here
			[UVToArr(0.0079087317, 0.2437216789, 0.4664944708, 0.6534416080), 0.04]
		]
	}],
	["metalcase_01_large_f.p3d", {
		[
			// Front duplicate mirrored
			[UVToArr(0.0159685612, 0.5834286809, 0.3323798478, 0.9881689548), 0.04],
			// top duplicate mirrored
			[UVToArr(0.8160079122, 0.3738329411, 0.9722650051, 0.5495740175), 0.04]
		]
	}],
	["equipment_box_f.p3d", { // Huh, same UV's as last one, neat
		[
			// Front duplicate mirrored
			[UVToArr(0.0159685612, 0.5834286809, 0.3323798478, 0.9881689548), 0.04],
			// top duplicate mirrored
			[UVToArr(0.8160079122, 0.3738329411, 0.9722650051, 0.5495740175), 0.04]
		]
	}],
	["ammobox_f.p3d", { // This box is a mess. It has 4 sets of vertices, and depending on which type (explosives, grenades) 3 sets are hidden
		[
			// Front and back
			[PixelCoords1024(654, 782, 360, 167), 0.06]
		]
	}],
	["wpnsbox_f.p3d", {
		[
			// Front and back
			[UVToArr(0.0140264034, 0.0685211420, 0.3375537395, 0.2060282230), 0.04]
		]
	}],
	["wpnsbox_long_f.p3d", {
		[
			// Front and back
			[UVToArr(0.0074185133, 0.5042082071, 0.5999680758, 0.6417262554), 0.06]
		]
	}],
	["box_uav_06_f.p3d", {
		[
			// Top
			[UVToArr(0.8217381239, 0.0366767906, 0.9999704361, 0.2156434953), 0.04]
		]
	}]
];

private _found = _boxParams findIf {_model == (_x select 0)};
//(call ((_boxParams param [_found, ["",{[0.3, 1, 1]}]]) select 1)) params ["_overlays"];
private _overlays = (call ((_boxParams param [_found, ["",{[0.3, 1, 1]}]]) select 1));


{
	_x params ["_x", "_y", "_w", "_h", "_sz"];

	private _ctrl = _display ctrlCreate ["RscTextNoShadow", -1];
	_ctrl ctrlSetPosition [_x, _y, _w, _h];
	_ctrl ctrlSetFont "TahomaB";
	_ctrl ctrlSetFontHeight _sz;
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetText _text;
}
forEach _overlays;