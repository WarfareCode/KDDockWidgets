/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2022 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'TypeHelpers.dart';
import '../Bindings.dart';
import '../FinalizerHelpers.dart';

var _dylib = Library.instance().dylib;
final _finalizer =
    _dylib.lookup<ffi.NativeFunction<Dart_WeakPersistentHandleFinalizer_Type>>(
        'c_KDDockWidgets__View_Finalizer');

class View {
  static var s_dartInstanceByCppPtr = Map<int, View>();
  var _thisCpp = null;
  bool _needsAutoDelete = false;
  get thisCpp => _thisCpp;
  set thisCpp(var ptr) {
    _thisCpp = ptr;
    ffi.Pointer<ffi.Void> ptrvoid = ptr.cast<ffi.Void>();
    if (_needsAutoDelete)
      newWeakPersistentHandle?.call(this, ptrvoid, 0, _finalizer);
  }

  static bool isCached(var cppPointer) {
    return s_dartInstanceByCppPtr.containsKey(cppPointer.address);
  }

  factory View.fromCache(var cppPointer, [needsAutoDelete = false]) {
    return (s_dartInstanceByCppPtr[cppPointer.address] ??
        View.fromCppPointer(cppPointer, needsAutoDelete)) as View;
  }
  View.fromCppPointer(var cppPointer, [this._needsAutoDelete = false]) {
    thisCpp = cppPointer;
  }
  View.init() {} //View(KDDockWidgets::Controller * controller, KDDockWidgets::Type arg__2)
  View(Controller? controller, int arg__2) {
    final voidstar_Func_voidstar_int func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_ffi_Int32_FFI>>(
            'c_KDDockWidgets__View__constructor_Controller_Type')
        .asFunction();
    thisCpp =
        func(controller == null ? ffi.nullptr : controller.thisCpp, arg__2);
    View.s_dartInstanceByCppPtr[thisCpp.address] = this;
    registerCallbacks();
  } // aboutToBeDestroyed() const
  bool aboutToBeDestroyed() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__aboutToBeDestroyed')
        .asFunction();
    return func(thisCpp) != 0;
  } // activateWindow()

  activateWindow() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(831))
        .asFunction();
    func(thisCpp);
  }

  static void activateWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::activateWindow()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.activateWindow();
  } // asDropAreaController() const

  DropArea asDropAreaController() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__asDropAreaController')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return DropArea.fromCppPointer(result, false);
  } // asGroupController() const

  Group asGroupController() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__asGroupController')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return Group.fromCppPointer(result, false);
  } // asLayout() const

  Layout asLayout() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__asLayout')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return Layout.fromCppPointer(result, false);
  } // asStackController() const

  Stack asStackController() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__asStackController')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return Stack.fromCppPointer(result, false);
  } // asTabBarController() const

  TabBar asTabBarController() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__asTabBarController')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return TabBar.fromCppPointer(result, false);
  } // asTitleBarController() const

  TitleBar asTitleBarController() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__asTitleBarController')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return TitleBar.fromCppPointer(result, false);
  }

  static // boundedMaxSize(QSize min, QSize max)
      QSize boundedMaxSize(QSize min, QSize max) {
    final voidstar_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_voidstar_FFI>>(
            'c_static_KDDockWidgets__View__boundedMaxSize_QSize_QSize')
        .asFunction();
    ffi.Pointer<void> result = func(min == null ? ffi.nullptr : min.thisCpp,
        max == null ? ffi.nullptr : max.thisCpp);
    return QSize.fromCppPointer(result, true);
  } // close()

  bool close() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            cFunctionSymbolName(839))
        .asFunction();
    return func(thisCpp) != 0;
  }

  static int close_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print("Dart instance not found for View::close()! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.close();
    return result ? 1 : 0;
  } // closeRootView()

  closeRootView() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__closeRootView')
        .asFunction();
    func(thisCpp);
  } // controller() const

  Controller controller() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__controller')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return Controller.fromCppPointer(result, false);
  } // createPlatformWindow()

  createPlatformWindow() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(842))
        .asFunction();
    func(thisCpp);
  }

  static void createPlatformWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::createPlatformWindow()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.createPlatformWindow();
  }

  static // equals(const KDDockWidgets::View * one, const KDDockWidgets::View * two)
      bool equals(View? one, View? two) {
    final bool_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_voidstar_FFI>>(
            'c_static_KDDockWidgets__View__equals_View_View')
        .asFunction();
    return func(one == null ? ffi.nullptr : one.thisCpp,
            two == null ? ffi.nullptr : two.thisCpp) !=
        0;
  } // equals(const KDDockWidgets::View * other) const

  bool equals_2(View? other) {
    final bool_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_voidstar_FFI>>(
            'c_KDDockWidgets__View__equals_View')
        .asFunction();
    return func(thisCpp, other == null ? ffi.nullptr : other.thisCpp) != 0;
  } // firstParentOfType(KDDockWidgets::Type arg__1) const

  Controller firstParentOfType(int arg__1) {
    final voidstar_Func_voidstar_int func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_ffi_Int32_FFI>>(
            'c_KDDockWidgets__View__firstParentOfType_Type')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp, arg__1);
    return Controller.fromCppPointer(result, false);
  }

  static // firstParentOfType(KDDockWidgets::View * view, KDDockWidgets::Type arg__2)
      Controller firstParentOfType_2(View? view, int arg__2) {
    final voidstar_Func_voidstar_int func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_ffi_Int32_FFI>>(
            'c_static_KDDockWidgets__View__firstParentOfType_View_Type')
        .asFunction();
    ffi.Pointer<void> result =
        func(view == null ? ffi.nullptr : view.thisCpp, arg__2);
    return Controller.fromCppPointer(result, false);
  } // flags() const

  int flags() {
    final int_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<int_Func_voidstar_FFI>>(
            cFunctionSymbolName(847))
        .asFunction();
    return func(thisCpp);
  }

  static int flags_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::flags() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.flags();
    return result;
  } // free()

  free() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__free')
        .asFunction();
    func(thisCpp);
  } // free_impl()

  free_impl() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(849))
        .asFunction();
    func(thisCpp);
  }

  static void free_impl_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::free_impl()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.free_impl();
  } // freed() const

  bool freed() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__freed')
        .asFunction();
    return func(thisCpp) != 0;
  } // geometry() const

  QRect geometry() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            cFunctionSymbolName(851))
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QRect.fromCppPointer(result, true);
  }

  static ffi.Pointer<void> geometry_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::geometry() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.geometry();
    return result.thisCpp;
  } // globalGeometry() const

  QRect globalGeometry() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__globalGeometry')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QRect.fromCppPointer(result, true);
  } // grabMouse()

  grabMouse() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(853))
        .asFunction();
    func(thisCpp);
  }

  static void grabMouse_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::grabMouse()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.grabMouse();
  }

  static // hardcodedMinimumSize()
      QSize hardcodedMinimumSize() {
    final voidstar_Func_void func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_void_FFI>>(
            'c_static_KDDockWidgets__View__hardcodedMinimumSize')
        .asFunction();
    ffi.Pointer<void> result = func();
    return QSize.fromCppPointer(result, true);
  } // hasFocus() const

  bool hasFocus() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            cFunctionSymbolName(856))
        .asFunction();
    return func(thisCpp) != 0;
  }

  static int hasFocus_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::hasFocus() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.hasFocus();
    return result ? 1 : 0;
  } // height() const

  int height() {
    final int_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<int_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__height')
        .asFunction();
    return func(thisCpp);
  } // hide()

  hide() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(858))
        .asFunction();
    func(thisCpp);
  }

  static void hide_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print("Dart instance not found for View::hide()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.hide();
  } // id() const

  QString id() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__id')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QString.fromCppPointer(result, true);
  } // inDtor() const

  bool inDtor() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__inDtor')
        .asFunction();
    return func(thisCpp) != 0;
  } // init()

  init() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(861))
        .asFunction();
    func(thisCpp);
  }

  static void init_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print("Dart instance not found for View::init()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.init();
  } // isActiveWindow() const

  bool isActiveWindow() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            cFunctionSymbolName(863))
        .asFunction();
    return func(thisCpp) != 0;
  }

  static int isActiveWindow_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isActiveWindow() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isActiveWindow();
    return result ? 1 : 0;
  } // isMaximized() const

  bool isMaximized() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            cFunctionSymbolName(864))
        .asFunction();
    return func(thisCpp) != 0;
  }

  static int isMaximized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isMaximized() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMaximized();
    return result ? 1 : 0;
  } // isMinimized() const

  bool isMinimized() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            cFunctionSymbolName(865))
        .asFunction();
    return func(thisCpp) != 0;
  }

  static int isMinimized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isMinimized() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isMinimized();
    return result ? 1 : 0;
  } // isNull() const

  bool isNull() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            cFunctionSymbolName(866))
        .asFunction();
    return func(thisCpp) != 0;
  }

  static int isNull_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isNull() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isNull();
    return result ? 1 : 0;
  } // isRootView() const

  bool isRootView() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            cFunctionSymbolName(867))
        .asFunction();
    return func(thisCpp) != 0;
  }

  static int isRootView_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isRootView() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isRootView();
    return result ? 1 : 0;
  } // isVisible() const

  bool isVisible() {
    final bool_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_FFI>>(
            cFunctionSymbolName(868))
        .asFunction();
    return func(thisCpp) != 0;
  }

  static int isVisible_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::isVisible() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.isVisible();
    return result ? 1 : 0;
  } // mapFromGlobal(QPoint arg__1) const

  QPoint mapFromGlobal(QPoint arg__1) {
    final voidstar_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(869))
        .asFunction();
    ffi.Pointer<void> result =
        func(thisCpp, arg__1 == null ? ffi.nullptr : arg__1.thisCpp);
    return QPoint.fromCppPointer(result, true);
  }

  static ffi.Pointer<void> mapFromGlobal_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::mapFromGlobal(QPoint arg__1) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapFromGlobal(QPoint.fromCppPointer(arg__1));
    return result.thisCpp;
  } // mapTo(KDDockWidgets::View * arg__1, QPoint arg__2) const

  QPoint mapTo(View? arg__1, QPoint arg__2) {
    final voidstar_Func_voidstar_voidstar_voidstar func = _dylib
        .lookup<
                ffi.NativeFunction<
                    voidstar_Func_voidstar_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(870))
        .asFunction();
    ffi.Pointer<void> result = func(
        thisCpp,
        arg__1 == null ? ffi.nullptr : arg__1.thisCpp,
        arg__2 == null ? ffi.nullptr : arg__2.thisCpp);
    return QPoint.fromCppPointer(result, true);
  }

  static ffi.Pointer<void> mapTo_calledFromC(ffi.Pointer<void> thisCpp,
      ffi.Pointer<void>? arg__1, ffi.Pointer<void> arg__2) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::mapTo(KDDockWidgets::View * arg__1, QPoint arg__2) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapTo(
        View.fromCppPointer(arg__1), QPoint.fromCppPointer(arg__2));
    return result.thisCpp;
  } // mapToGlobal(QPoint arg__1) const

  QPoint mapToGlobal(QPoint arg__1) {
    final voidstar_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(871))
        .asFunction();
    ffi.Pointer<void> result =
        func(thisCpp, arg__1 == null ? ffi.nullptr : arg__1.thisCpp);
    return QPoint.fromCppPointer(result, true);
  }

  static ffi.Pointer<void> mapToGlobal_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::mapToGlobal(QPoint arg__1) const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.mapToGlobal(QPoint.fromCppPointer(arg__1));
    return result.thisCpp;
  } // maxSizeHint() const

  QSize maxSizeHint() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            cFunctionSymbolName(872))
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QSize.fromCppPointer(result, true);
  }

  static ffi.Pointer<void> maxSizeHint_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::maxSizeHint() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.maxSizeHint();
    return result.thisCpp;
  } // maximumSize() const

  QSize maximumSize() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            cFunctionSymbolName(873))
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QSize.fromCppPointer(result, true);
  }

  static ffi.Pointer<void> maximumSize_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::maximumSize() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.maximumSize();
    return result.thisCpp;
  } // minSize() const

  QSize minSize() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            cFunctionSymbolName(874))
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QSize.fromCppPointer(result, true);
  }

  static ffi.Pointer<void> minSize_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::minSize() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.minSize();
    return result.thisCpp;
  } // minimumHeight() const

  int minimumHeight() {
    final int_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<int_Func_voidstar_FFI>>(
            cFunctionSymbolName(875))
        .asFunction();
    return func(thisCpp);
  }

  static int minimumHeight_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::minimumHeight() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.minimumHeight();
    return result;
  } // minimumWidth() const

  int minimumWidth() {
    final int_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<int_Func_voidstar_FFI>>(
            cFunctionSymbolName(876))
        .asFunction();
    return func(thisCpp);
  }

  static int minimumWidth_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::minimumWidth() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.minimumWidth();
    return result;
  } // move(QPoint arg__1)

  move(QPoint arg__1) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            'c_KDDockWidgets__View__move_QPoint')
        .asFunction();
    func(thisCpp, arg__1 == null ? ffi.nullptr : arg__1.thisCpp);
  } // move(int x, int y)

  move_2(int x, int y) {
    final void_Func_voidstar_int_int func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>>(
            cFunctionSymbolName(878))
        .asFunction();
    func(thisCpp, x, y);
  }

  static void move_2_calledFromC(ffi.Pointer<void> thisCpp, int x, int y) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::move(int x, int y)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.move_2(x, y);
  } // normalGeometry() const

  QRect normalGeometry() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            cFunctionSymbolName(879))
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QRect.fromCppPointer(result, true);
  }

  static ffi.Pointer<void> normalGeometry_calledFromC(
      ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::normalGeometry() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.normalGeometry();
    return result.thisCpp;
  } // objectName() const

  QString objectName() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            cFunctionSymbolName(880))
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QString.fromCppPointer(result, true);
  }

  static ffi.Pointer<void> objectName_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::objectName() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.objectName();
    return result.thisCpp;
  } // onResize(QSize newSize)

  bool onResize(QSize newSize) {
    final bool_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<bool_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(881))
        .asFunction();
    return func(thisCpp, newSize == null ? ffi.nullptr : newSize.thisCpp) != 0;
  }

  static int onResize_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> newSize) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::onResize(QSize newSize)! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.onResize(QSize.fromCppPointer(newSize));
    return result ? 1 : 0;
  } // parentSize() const

  QSize parentSize() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__parentSize')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QSize.fromCppPointer(result, true);
  } // pos() const

  QPoint pos() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__pos')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QPoint.fromCppPointer(result, true);
  } // raise()

  raise() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(884))
        .asFunction();
    func(thisCpp);
  }

  static void raise_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print("Dart instance not found for View::raise()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raise();
  } // raiseAndActivate()

  raiseAndActivate() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(885))
        .asFunction();
    func(thisCpp);
  }

  static void raiseAndActivate_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::raiseAndActivate()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.raiseAndActivate();
  } // rect() const

  QRect rect() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__rect')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QRect.fromCppPointer(result, true);
  } // releaseKeyboard()

  releaseKeyboard() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(887))
        .asFunction();
    func(thisCpp);
  }

  static void releaseKeyboard_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::releaseKeyboard()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.releaseKeyboard();
  } // releaseMouse()

  releaseMouse() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(888))
        .asFunction();
    func(thisCpp);
  }

  static void releaseMouse_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::releaseMouse()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.releaseMouse();
  } // resize(QSize arg__1)

  resize(QSize arg__1) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            'c_KDDockWidgets__View__resize_QSize')
        .asFunction();
    func(thisCpp, arg__1 == null ? ffi.nullptr : arg__1.thisCpp);
  } // resize(int w, int h)

  resize_2(int w, int h) {
    final void_Func_voidstar_int_int func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>>(
            'c_KDDockWidgets__View__resize_int_int')
        .asFunction();
    func(thisCpp, w, h);
  } // setAboutToBeDestroyed()

  setAboutToBeDestroyed() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__setAboutToBeDestroyed')
        .asFunction();
    func(thisCpp);
  } // setCursor(Qt::CursorShape arg__1)

  setCursor(int arg__1) {
    final void_Func_voidstar_int func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_ffi_Int32_FFI>>(
            cFunctionSymbolName(892))
        .asFunction();
    func(thisCpp, arg__1);
  }

  static void setCursor_calledFromC(ffi.Pointer<void> thisCpp, int arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setCursor(Qt::CursorShape arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setCursor(arg__1);
  } // setFixedHeight(int arg__1)

  setFixedHeight(int arg__1) {
    final void_Func_voidstar_int func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_ffi_Int32_FFI>>(
            cFunctionSymbolName(893))
        .asFunction();
    func(thisCpp, arg__1);
  }

  static void setFixedHeight_calledFromC(
      ffi.Pointer<void> thisCpp, int arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setFixedHeight(int arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setFixedHeight(arg__1);
  } // setFixedWidth(int arg__1)

  setFixedWidth(int arg__1) {
    final void_Func_voidstar_int func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_ffi_Int32_FFI>>(
            cFunctionSymbolName(894))
        .asFunction();
    func(thisCpp, arg__1);
  }

  static void setFixedWidth_calledFromC(ffi.Pointer<void> thisCpp, int arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setFixedWidth(int arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setFixedWidth(arg__1);
  } // setGeometry(QRect arg__1)

  setGeometry(QRect arg__1) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(895))
        .asFunction();
    func(thisCpp, arg__1 == null ? ffi.nullptr : arg__1.thisCpp);
  }

  static void setGeometry_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setGeometry(QRect arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setGeometry(QRect.fromCppPointer(arg__1));
  } // setHeight(int height)

  setHeight(int height) {
    final void_Func_voidstar_int func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_ffi_Int32_FFI>>(
            cFunctionSymbolName(896))
        .asFunction();
    func(thisCpp, height);
  }

  static void setHeight_calledFromC(ffi.Pointer<void> thisCpp, int height) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setHeight(int height)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setHeight(height);
  } // setMaximumSize(QSize sz)

  setMaximumSize(QSize sz) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(897))
        .asFunction();
    func(thisCpp, sz == null ? ffi.nullptr : sz.thisCpp);
  }

  static void setMaximumSize_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> sz) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setMaximumSize(QSize sz)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMaximumSize(QSize.fromCppPointer(sz));
  } // setMinimumSize(QSize arg__1)

  setMinimumSize(QSize arg__1) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(898))
        .asFunction();
    func(thisCpp, arg__1 == null ? ffi.nullptr : arg__1.thisCpp);
  }

  static void setMinimumSize_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void> arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setMinimumSize(QSize arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMinimumSize(QSize.fromCppPointer(arg__1));
  } // setMouseTracking(bool arg__1)

  setMouseTracking(bool arg__1) {
    final void_Func_voidstar_bool func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_ffi_Int8_FFI>>(
            cFunctionSymbolName(899))
        .asFunction();
    func(thisCpp, arg__1 ? 1 : 0);
  }

  static void setMouseTracking_calledFromC(
      ffi.Pointer<void> thisCpp, int arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setMouseTracking(bool arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setMouseTracking(arg__1 != 0);
  } // setObjectName(const QString & arg__1)

  setObjectName(String? arg__1) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(900))
        .asFunction();
    func(thisCpp, arg__1?.toNativeUtf8() ?? ffi.nullptr);
  }

  static void setObjectName_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setObjectName(const QString & arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setObjectName(QString.fromCppPointer(arg__1).toDartString());
  } // setParent(KDDockWidgets::View * arg__1)

  setParent(View? arg__1) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(901))
        .asFunction();
    func(thisCpp, arg__1 == null ? ffi.nullptr : arg__1.thisCpp);
  }

  static void setParent_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setParent(KDDockWidgets::View * arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setParent(View.fromCppPointer(arg__1));
  } // setSize(QSize arg__1)

  setSize(QSize arg__1) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            'c_KDDockWidgets__View__setSize_QSize')
        .asFunction();
    func(thisCpp, arg__1 == null ? ffi.nullptr : arg__1.thisCpp);
  } // setSize(int width, int height)

  setSize_2(int width, int height) {
    final void_Func_voidstar_int_int func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>>(
            cFunctionSymbolName(903))
        .asFunction();
    func(thisCpp, width, height);
  }

  static void setSize_2_calledFromC(
      ffi.Pointer<void> thisCpp, int width, int height) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setSize(int width, int height)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setSize_2(width, height);
  } // setVisible(bool arg__1)

  setVisible(bool arg__1) {
    final void_Func_voidstar_bool func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_ffi_Int8_FFI>>(
            cFunctionSymbolName(904))
        .asFunction();
    func(thisCpp, arg__1 ? 1 : 0);
  }

  static void setVisible_calledFromC(ffi.Pointer<void> thisCpp, int arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setVisible(bool arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setVisible(arg__1 != 0);
  } // setWidth(int width)

  setWidth(int width) {
    final void_Func_voidstar_int func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_ffi_Int32_FFI>>(
            cFunctionSymbolName(905))
        .asFunction();
    func(thisCpp, width);
  }

  static void setWidth_calledFromC(ffi.Pointer<void> thisCpp, int width) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setWidth(int width)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWidth(width);
  } // setWindowOpacity(double arg__1)

  setWindowOpacity(double arg__1) {
    final void_Func_voidstar_double func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_ffi_Double_FFI>>(
            cFunctionSymbolName(906))
        .asFunction();
    func(thisCpp, arg__1);
  }

  static void setWindowOpacity_calledFromC(
      ffi.Pointer<void> thisCpp, double arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setWindowOpacity(double arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWindowOpacity(arg__1);
  } // setWindowTitle(const QString & title)

  setWindowTitle(String? title) {
    final void_Func_voidstar_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_voidstar_FFI>>(
            cFunctionSymbolName(907))
        .asFunction();
    func(thisCpp, title?.toNativeUtf8() ?? ffi.nullptr);
  }

  static void setWindowTitle_calledFromC(
      ffi.Pointer<void> thisCpp, ffi.Pointer<void>? title) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setWindowTitle(const QString & title)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setWindowTitle(QString.fromCppPointer(title).toDartString());
  } // setZOrder(int arg__1)

  setZOrder(int arg__1) {
    final void_Func_voidstar_int func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_ffi_Int32_FFI>>(
            cFunctionSymbolName(908))
        .asFunction();
    func(thisCpp, arg__1);
  }

  static void setZOrder_calledFromC(ffi.Pointer<void> thisCpp, int arg__1) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::setZOrder(int arg__1)! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.setZOrder(arg__1);
  } // show()

  show() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(909))
        .asFunction();
    func(thisCpp);
  }

  static void show_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print("Dart instance not found for View::show()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.show();
  } // showMaximized()

  showMaximized() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(910))
        .asFunction();
    func(thisCpp);
  }

  static void showMaximized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::showMaximized()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showMaximized();
  } // showMinimized()

  showMinimized() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(911))
        .asFunction();
    func(thisCpp);
  }

  static void showMinimized_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::showMinimized()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showMinimized();
  } // showNormal()

  showNormal() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(912))
        .asFunction();
    func(thisCpp);
  }

  static void showNormal_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::showNormal()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.showNormal();
  } // size() const

  QSize size() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__size')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QSize.fromCppPointer(result, true);
  } // sizeHint() const

  QSize sizeHint() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            cFunctionSymbolName(914))
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QSize.fromCppPointer(result, true);
  }

  static ffi.Pointer<void> sizeHint_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print(
          "Dart instance not found for View::sizeHint() const! (${thisCpp.address})");
      throw Error();
    }
    final result = dartInstance.sizeHint();
    return result.thisCpp;
  } // type() const

  int type() {
    final int_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<int_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__type')
        .asFunction();
    return func(thisCpp);
  } // update()

  update() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            cFunctionSymbolName(916))
        .asFunction();
    func(thisCpp);
  }

  static void update_calledFromC(ffi.Pointer<void> thisCpp) {
    var dartInstance = View.s_dartInstanceByCppPtr[thisCpp.address];
    if (dartInstance == null) {
      print("Dart instance not found for View::update()! (${thisCpp.address})");
      throw Error();
    }
    dartInstance.update();
  } // width() const

  int width() {
    final int_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<int_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__width')
        .asFunction();
    return func(thisCpp);
  } // windowGeometry() const

  QRect windowGeometry() {
    final voidstar_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<voidstar_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__windowGeometry')
        .asFunction();
    ffi.Pointer<void> result = func(thisCpp);
    return QRect.fromCppPointer(result, true);
  } // x() const

  int x() {
    final int_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<int_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__x')
        .asFunction();
    return func(thisCpp);
  } // y() const

  int y() {
    final int_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<int_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__y')
        .asFunction();
    return func(thisCpp);
  }

  void release() {
    final void_Func_voidstar func = _dylib
        .lookup<ffi.NativeFunction<void_Func_voidstar_FFI>>(
            'c_KDDockWidgets__View__destructor')
        .asFunction();
    func(thisCpp);
  }

  String cFunctionSymbolName(int methodId) {
    switch (methodId) {
      case 831:
        return "c_KDDockWidgets__View__activateWindow";
      case 839:
        return "c_KDDockWidgets__View__close";
      case 842:
        return "c_KDDockWidgets__View__createPlatformWindow";
      case 847:
        return "c_KDDockWidgets__View__flags";
      case 849:
        return "c_KDDockWidgets__View__free_impl";
      case 851:
        return "c_KDDockWidgets__View__geometry";
      case 853:
        return "c_KDDockWidgets__View__grabMouse";
      case 856:
        return "c_KDDockWidgets__View__hasFocus";
      case 858:
        return "c_KDDockWidgets__View__hide";
      case 861:
        return "c_KDDockWidgets__View__init";
      case 863:
        return "c_KDDockWidgets__View__isActiveWindow";
      case 864:
        return "c_KDDockWidgets__View__isMaximized";
      case 865:
        return "c_KDDockWidgets__View__isMinimized";
      case 866:
        return "c_KDDockWidgets__View__isNull";
      case 867:
        return "c_KDDockWidgets__View__isRootView";
      case 868:
        return "c_KDDockWidgets__View__isVisible";
      case 869:
        return "c_KDDockWidgets__View__mapFromGlobal_QPoint";
      case 870:
        return "c_KDDockWidgets__View__mapTo_View_QPoint";
      case 871:
        return "c_KDDockWidgets__View__mapToGlobal_QPoint";
      case 872:
        return "c_KDDockWidgets__View__maxSizeHint";
      case 873:
        return "c_KDDockWidgets__View__maximumSize";
      case 874:
        return "c_KDDockWidgets__View__minSize";
      case 875:
        return "c_KDDockWidgets__View__minimumHeight";
      case 876:
        return "c_KDDockWidgets__View__minimumWidth";
      case 878:
        return "c_KDDockWidgets__View__move_int_int";
      case 879:
        return "c_KDDockWidgets__View__normalGeometry";
      case 880:
        return "c_KDDockWidgets__View__objectName";
      case 881:
        return "c_KDDockWidgets__View__onResize_QSize";
      case 884:
        return "c_KDDockWidgets__View__raise";
      case 885:
        return "c_KDDockWidgets__View__raiseAndActivate";
      case 887:
        return "c_KDDockWidgets__View__releaseKeyboard";
      case 888:
        return "c_KDDockWidgets__View__releaseMouse";
      case 892:
        return "c_KDDockWidgets__View__setCursor_CursorShape";
      case 893:
        return "c_KDDockWidgets__View__setFixedHeight_int";
      case 894:
        return "c_KDDockWidgets__View__setFixedWidth_int";
      case 895:
        return "c_KDDockWidgets__View__setGeometry_QRect";
      case 896:
        return "c_KDDockWidgets__View__setHeight_int";
      case 897:
        return "c_KDDockWidgets__View__setMaximumSize_QSize";
      case 898:
        return "c_KDDockWidgets__View__setMinimumSize_QSize";
      case 899:
        return "c_KDDockWidgets__View__setMouseTracking_bool";
      case 900:
        return "c_KDDockWidgets__View__setObjectName_QString";
      case 901:
        return "c_KDDockWidgets__View__setParent_View";
      case 903:
        return "c_KDDockWidgets__View__setSize_int_int";
      case 904:
        return "c_KDDockWidgets__View__setVisible_bool";
      case 905:
        return "c_KDDockWidgets__View__setWidth_int";
      case 906:
        return "c_KDDockWidgets__View__setWindowOpacity_double";
      case 907:
        return "c_KDDockWidgets__View__setWindowTitle_QString";
      case 908:
        return "c_KDDockWidgets__View__setZOrder_int";
      case 909:
        return "c_KDDockWidgets__View__show";
      case 910:
        return "c_KDDockWidgets__View__showMaximized";
      case 911:
        return "c_KDDockWidgets__View__showMinimized";
      case 912:
        return "c_KDDockWidgets__View__showNormal";
      case 914:
        return "c_KDDockWidgets__View__sizeHint";
      case 916:
        return "c_KDDockWidgets__View__update";
    }
    return "";
  }

  static String methodNameFromId(int methodId) {
    switch (methodId) {
      case 831:
        return "activateWindow";
      case 839:
        return "close";
      case 842:
        return "createPlatformWindow";
      case 847:
        return "flags";
      case 849:
        return "free_impl";
      case 851:
        return "geometry";
      case 853:
        return "grabMouse";
      case 856:
        return "hasFocus";
      case 858:
        return "hide";
      case 861:
        return "init";
      case 863:
        return "isActiveWindow";
      case 864:
        return "isMaximized";
      case 865:
        return "isMinimized";
      case 866:
        return "isNull";
      case 867:
        return "isRootView";
      case 868:
        return "isVisible";
      case 869:
        return "mapFromGlobal";
      case 870:
        return "mapTo";
      case 871:
        return "mapToGlobal";
      case 872:
        return "maxSizeHint";
      case 873:
        return "maximumSize";
      case 874:
        return "minSize";
      case 875:
        return "minimumHeight";
      case 876:
        return "minimumWidth";
      case 878:
        return "move_2";
      case 879:
        return "normalGeometry";
      case 880:
        return "objectName";
      case 881:
        return "onResize";
      case 884:
        return "raise";
      case 885:
        return "raiseAndActivate";
      case 887:
        return "releaseKeyboard";
      case 888:
        return "releaseMouse";
      case 892:
        return "setCursor";
      case 893:
        return "setFixedHeight";
      case 894:
        return "setFixedWidth";
      case 895:
        return "setGeometry";
      case 896:
        return "setHeight";
      case 897:
        return "setMaximumSize";
      case 898:
        return "setMinimumSize";
      case 899:
        return "setMouseTracking";
      case 900:
        return "setObjectName";
      case 901:
        return "setParent";
      case 903:
        return "setSize_2";
      case 904:
        return "setVisible";
      case 905:
        return "setWidth";
      case 906:
        return "setWindowOpacity";
      case 907:
        return "setWindowTitle";
      case 908:
        return "setZOrder";
      case 909:
        return "show";
      case 910:
        return "showMaximized";
      case 911:
        return "showMinimized";
      case 912:
        return "showNormal";
      case 914:
        return "sizeHint";
      case 916:
        return "update";
    }
    throw Error();
  }

  void registerCallbacks() {
    assert(thisCpp != null);
    final RegisterMethodIsReimplementedCallback registerCallback = _dylib
        .lookup<ffi.NativeFunction<RegisterMethodIsReimplementedCallback_FFI>>(
            'c_KDDockWidgets__View__registerVirtualMethodCallback')
        .asFunction();
    final callback831 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        View.activateWindow_calledFromC);
    registerCallback(thisCpp, callback831, 831);
    const callbackExcept839 = 0;
    final callback839 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        View.close_calledFromC, callbackExcept839);
    registerCallback(thisCpp, callback839, 839);
    final callback842 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        View.createPlatformWindow_calledFromC);
    registerCallback(thisCpp, callback842, 842);
    const callbackExcept847 = 0;
    final callback847 = ffi.Pointer.fromFunction<int_Func_voidstar_FFI>(
        View.flags_calledFromC, callbackExcept847);
    registerCallback(thisCpp, callback847, 847);
    final callback849 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        View.free_impl_calledFromC);
    registerCallback(thisCpp, callback849, 849);
    final callback851 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        View.geometry_calledFromC);
    registerCallback(thisCpp, callback851, 851);
    final callback853 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        View.grabMouse_calledFromC);
    registerCallback(thisCpp, callback853, 853);
    const callbackExcept856 = 0;
    final callback856 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        View.hasFocus_calledFromC, callbackExcept856);
    registerCallback(thisCpp, callback856, 856);
    final callback858 =
        ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(View.hide_calledFromC);
    registerCallback(thisCpp, callback858, 858);
    final callback861 =
        ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(View.init_calledFromC);
    registerCallback(thisCpp, callback861, 861);
    const callbackExcept863 = 0;
    final callback863 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        View.isActiveWindow_calledFromC, callbackExcept863);
    registerCallback(thisCpp, callback863, 863);
    const callbackExcept864 = 0;
    final callback864 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        View.isMaximized_calledFromC, callbackExcept864);
    registerCallback(thisCpp, callback864, 864);
    const callbackExcept865 = 0;
    final callback865 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        View.isMinimized_calledFromC, callbackExcept865);
    registerCallback(thisCpp, callback865, 865);
    const callbackExcept866 = 0;
    final callback866 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        View.isNull_calledFromC, callbackExcept866);
    registerCallback(thisCpp, callback866, 866);
    const callbackExcept867 = 0;
    final callback867 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        View.isRootView_calledFromC, callbackExcept867);
    registerCallback(thisCpp, callback867, 867);
    const callbackExcept868 = 0;
    final callback868 = ffi.Pointer.fromFunction<bool_Func_voidstar_FFI>(
        View.isVisible_calledFromC, callbackExcept868);
    registerCallback(thisCpp, callback868, 868);
    final callback869 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_FFI>(
            View.mapFromGlobal_calledFromC);
    registerCallback(thisCpp, callback869, 869);
    final callback870 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_voidstar_FFI>(
            View.mapTo_calledFromC);
    registerCallback(thisCpp, callback870, 870);
    final callback871 =
        ffi.Pointer.fromFunction<voidstar_Func_voidstar_voidstar_FFI>(
            View.mapToGlobal_calledFromC);
    registerCallback(thisCpp, callback871, 871);
    final callback872 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        View.maxSizeHint_calledFromC);
    registerCallback(thisCpp, callback872, 872);
    final callback873 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        View.maximumSize_calledFromC);
    registerCallback(thisCpp, callback873, 873);
    final callback874 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        View.minSize_calledFromC);
    registerCallback(thisCpp, callback874, 874);
    const callbackExcept875 = 0;
    final callback875 = ffi.Pointer.fromFunction<int_Func_voidstar_FFI>(
        View.minimumHeight_calledFromC, callbackExcept875);
    registerCallback(thisCpp, callback875, 875);
    const callbackExcept876 = 0;
    final callback876 = ffi.Pointer.fromFunction<int_Func_voidstar_FFI>(
        View.minimumWidth_calledFromC, callbackExcept876);
    registerCallback(thisCpp, callback876, 876);
    final callback878 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            View.move_2_calledFromC);
    registerCallback(thisCpp, callback878, 878);
    final callback879 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        View.normalGeometry_calledFromC);
    registerCallback(thisCpp, callback879, 879);
    final callback880 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        View.objectName_calledFromC);
    registerCallback(thisCpp, callback880, 880);
    const callbackExcept881 = 0;
    final callback881 =
        ffi.Pointer.fromFunction<bool_Func_voidstar_voidstar_FFI>(
            View.onResize_calledFromC, callbackExcept881);
    registerCallback(thisCpp, callback881, 881);
    final callback884 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        View.raise_calledFromC);
    registerCallback(thisCpp, callback884, 884);
    final callback885 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        View.raiseAndActivate_calledFromC);
    registerCallback(thisCpp, callback885, 885);
    final callback887 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        View.releaseKeyboard_calledFromC);
    registerCallback(thisCpp, callback887, 887);
    final callback888 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        View.releaseMouse_calledFromC);
    registerCallback(thisCpp, callback888, 888);
    final callback892 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            View.setCursor_calledFromC);
    registerCallback(thisCpp, callback892, 892);
    final callback893 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            View.setFixedHeight_calledFromC);
    registerCallback(thisCpp, callback893, 893);
    final callback894 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            View.setFixedWidth_calledFromC);
    registerCallback(thisCpp, callback894, 894);
    final callback895 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            View.setGeometry_calledFromC);
    registerCallback(thisCpp, callback895, 895);
    final callback896 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            View.setHeight_calledFromC);
    registerCallback(thisCpp, callback896, 896);
    final callback897 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            View.setMaximumSize_calledFromC);
    registerCallback(thisCpp, callback897, 897);
    final callback898 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            View.setMinimumSize_calledFromC);
    registerCallback(thisCpp, callback898, 898);
    final callback899 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int8_FFI>(
            View.setMouseTracking_calledFromC);
    registerCallback(thisCpp, callback899, 899);
    final callback900 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            View.setObjectName_calledFromC);
    registerCallback(thisCpp, callback900, 900);
    final callback901 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            View.setParent_calledFromC);
    registerCallback(thisCpp, callback901, 901);
    final callback903 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_ffi_Int32_FFI>(
            View.setSize_2_calledFromC);
    registerCallback(thisCpp, callback903, 903);
    final callback904 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int8_FFI>(
            View.setVisible_calledFromC);
    registerCallback(thisCpp, callback904, 904);
    final callback905 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            View.setWidth_calledFromC);
    registerCallback(thisCpp, callback905, 905);
    final callback906 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Double_FFI>(
            View.setWindowOpacity_calledFromC);
    registerCallback(thisCpp, callback906, 906);
    final callback907 =
        ffi.Pointer.fromFunction<void_Func_voidstar_voidstar_FFI>(
            View.setWindowTitle_calledFromC);
    registerCallback(thisCpp, callback907, 907);
    final callback908 =
        ffi.Pointer.fromFunction<void_Func_voidstar_ffi_Int32_FFI>(
            View.setZOrder_calledFromC);
    registerCallback(thisCpp, callback908, 908);
    final callback909 =
        ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(View.show_calledFromC);
    registerCallback(thisCpp, callback909, 909);
    final callback910 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        View.showMaximized_calledFromC);
    registerCallback(thisCpp, callback910, 910);
    final callback911 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        View.showMinimized_calledFromC);
    registerCallback(thisCpp, callback911, 911);
    final callback912 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        View.showNormal_calledFromC);
    registerCallback(thisCpp, callback912, 912);
    final callback914 = ffi.Pointer.fromFunction<voidstar_Func_voidstar_FFI>(
        View.sizeHint_calledFromC);
    registerCallback(thisCpp, callback914, 914);
    final callback916 = ffi.Pointer.fromFunction<void_Func_voidstar_FFI>(
        View.update_calledFromC);
    registerCallback(thisCpp, callback916, 916);
  }
}