
function getParam(sname) {
    var params = location.search.substr(location.search.indexOf("?") + 1);
    var sval = "";
    params = params.split("&");
    for (var i = 0; i < params.length; i++) {
        temp = params[i].split("=");
        if ([temp[0]] == sname) { sval = temp[1]; }
    }
    return sval;
}

function post_goto(url, parm, target) {
	var f = document.createElement('form');

	var objs, value;
	for ( var key in parm) {
		value = parm[key];
		objs = document.createElement('input');
		objs.setAttribute('type', 'hidden');
		objs.setAttribute('name', key);
		objs.setAttribute('value', value);
		f.appendChild(objs);
	}

	if (target)
		f.setAttribute('target', target);

	f.setAttribute('method', 'post');
	f.setAttribute('action', url);
	document.body.appendChild(f);
	f.submit();
}
