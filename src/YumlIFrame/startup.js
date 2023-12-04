var _div = document.getElementById("controlAddIn");
var _img = document.createElement("img");

_img.id = "yumlPicture";
_img.src = "";

var _a = document.createElement('a');
_a.id = "yumlLink";
_a.href = "";
_a.innerHTML = "Link";
_a.target = "_blank"

_div.appendChild(_a);
_div.appendChild(_img);

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ControlReady, []");


