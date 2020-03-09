library adaption;

import 'package:flutter/material.dart';

class Adaption {

	int designPixelsWidth;
	int designPixelsHeight;
	double scaleWidth;
	double scaleHeight;

	Size _logicSize;
	double devicePixelRatio;


	static Adaption _instance = Adaption._gen();

	Adaption._gen();

	static void design(BuildContext appContext, int designPixelsWidth, int designPixelsHeight) {
		_instance..designPixelsWidth = designPixelsWidth
			..designPixelsHeight = designPixelsHeight;
		_instance._init(appContext);
	}

	bool _init(BuildContext context) {
		if (_instance._logicSize != null) {
			return true;
		}

		if (context == null) return false;

		var media = MediaQuery.of(context);
		var size = media.size;
		if (size == null || size == Size.zero) {
			return false;
		}

		var devicePixelRatio = media.devicePixelRatio;

		_instance
			.._logicSize = size
			..devicePixelRatio = devicePixelRatio
			..scaleWidth = _instance._logicSize.width * devicePixelRatio / designPixelsWidth
			..scaleHeight = _instance._logicSize.height / designPixelsHeight;
		return true;
	}

	/// adaption actual pixels to logic length
	static int adaption(int pixels) {
		if (_instance._logicSize == null) {
			return pixels;
		}

		return _instance.scaleWidth * pixels ~/ _instance.devicePixelRatio;
	}

	/// adaption actual pixels to logic length
	static int adaptionHeight(int pixels) {
		if (_instance._logicSize == null) {
			return pixels;
		}

		return _instance.scaleHeight * pixels ~/ _instance.devicePixelRatio;
	}

	/// ratio logic length. ratio in (0, 100]
	static double ratio(double ratio) {
		if (ratio < 0) ratio = 0;
		if (ratio > 1) ratio = 1;

		if (_instance._logicSize == null) {
			var length = 360 * ratio;
			return length;
		}

		var length = _instance._logicSize.width * ratio;
		return length;
	}

	static double ratioHeight(double ratio) {
		if (ratio < 0) ratio = 0;
		if (ratio > 1) ratio = 1;

		if (_instance._logicSize == null) {
			var length = 720 * ratio;
			return length;
		}

		var length = _instance._logicSize.height * ratio;
		return length;
	}

}

extension AdaptionIntPixels on int {

	int adaptionPixels() {
		return Adaption.adaption(this);
	}

	int adaptionHeightPixels() {
		return Adaption.adaptionHeight(this);
	}
}

extension AdaptionDoubleRatio on double {
	double ratio() {
		return Adaption.ratio(this);
	}

	double ratioHeight() {
		return Adaption.ratioHeight(this);
	}
}
