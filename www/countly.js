// Countly Cordova Plugin by Guopeng Liang 02/2014

(function(cordova) {

	function Countly() {}

	Countly.prototype.recordEvent = function(key, count, sum, successCallback, failureCallback) {
		if (typeof sum === "undefined") {
			return cordova.exec(successCallback, failureCallback, 'Countly', 'recordEvent', [key, count || 1]);
		} else {
			return cordova.exec(successCallback, failureCallback, 'Countly', 'recordEventWithSum', [key, count || 1, sum]);
		}
	};

	Countly.prototype.recordEventWithSegmentation = function(key, segmentation, count, sum, successCallback, failureCallback) {
		if (typeof sum === "undefined") {
			return cordova.exec(successCallback, failureCallback, 'Countly', 'recordEventWithSegmentation', [key, segmentation, count || 1]);
		} else {
			return cordova.exec(successCallback, failureCallback, 'Countly', 'recordEventWithSegmentationAndSum', [key, segmentation, count || 1, sum]);
		}
	};

	Countly.install = function() {
		if (!window.plugins) {
			window.plugins = {};
		}
		window.plugins.countly = new Countly();
		//backward compatible
		window.countly = navigator.countly = window.plugins.countly;
	};

	cordova.addConstructor(Countly.install);

})(window.cordova || window.Cordova || window.PhoneGap);
