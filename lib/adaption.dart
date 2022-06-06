library adaption;

import 'package:flutter/material.dart';

class Adaption {
  Size? _logicSize;
  _MetricsChangedObserver? _observer;

  static Adaption _instance = Adaption._gen();

  Adaption._gen();

  static bool init() {
    if (_instance._logicSize != null) {
      return true;
    }
    _instance._reset();

    final window = WidgetsBinding.instance.window;
    final size = window.physicalSize;
    if (size == Size.zero) {
      return false;
    }

    _instance._observer = _MetricsChangedObserver._();
    WidgetsBinding.instance.addObserver(_instance._observer!);
    _instance._logicSize = size / window.devicePixelRatio;
    return true;
  }

  _reset() {
    _logicSize = null;
    if (_observer != null) WidgetsBinding.instance.removeObserver(_observer!);
    _observer = null;
  }

  /// ratio logic length. ratio in [0, 1]
  static double ratio(double ratio, {double? offset}) {
    if (ratio < 0) ratio = 0;
    if (ratio > 1) ratio = 1;

    if (_instance._logicSize == null && !init()) {
      var length = 360 * ratio;
      return length;
    }

    var length = (_instance._logicSize!.width - (offset ?? 0)) * ratio;
    return length;
  }

  static double ratioHeight(double ratio, {double? offset}) {
    if (ratio < 0) ratio = 0;
    if (ratio > 1) ratio = 1;

    if (_instance._logicSize == null && !init()) {
      var length = 720 * ratio;
      return length;
    }

    var length = (_instance._logicSize!.height - (offset ?? 0)) * ratio;
    return length;
  }
}

extension AdaptionDoubleRatio on double {
  double get w => Adaption.ratio(this);

  double get h => Adaption.ratioHeight(this);

  double wo(double offset) => Adaption.ratio(this, offset: offset);

  double ho(double offset) => Adaption.ratioHeight(this, offset: offset);

  @Deprecated("use [w] or [wo()] instead")
  double ratio({double? offset}) {
    return Adaption.ratio(this, offset: offset);
  }

  @Deprecated("use [h] or [ho()] instead")
  double ratioHeight() {
    return Adaption.ratioHeight(this);
  }
}

class _MetricsChangedObserver extends WidgetsBindingObserver {
  _MetricsChangedObserver._();

  @override
  void didChangeMetrics() {
    Adaption._instance._reset();
    Adaption.init();
  }
}
