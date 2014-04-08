// clobbers: navigator.countly

var exec = require('cordova/exec');

var countly = {

	recordEvent: function(key, count, sum, success, fail) {
		if (typeof sum === 'undefined') {
			exec(success, fail, 'Countly', 'recordEvent', [key, count || 1]);
		} else {
			exec(success, fail, 'Countly', 'recordEventWithSum', [key, count || 1, sum]);
		}
	},

	recordEventWithSegmentation: function(key, segmentation, count, sum, success, fail) {
		if (typeof sum === 'undefined') {
			exec(success, fail, 'Countly', 'recordEventWithSegmentation', [key, segmentation, count || 1]);
		} else {
			exec(success, fail, 'Countly', 'recordEventWithSegmentationAndSum', [key, segmentation, count || 1, sum]);
		}
	}

};

module.exports = countly;
