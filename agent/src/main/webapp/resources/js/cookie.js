	    var getCookie = function(name) {
	        var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	        return value? value[2] : null;
	    };


	    var setCookie = function(name, value, day) {
	        document.cookie = name + '=' + value;
	    };