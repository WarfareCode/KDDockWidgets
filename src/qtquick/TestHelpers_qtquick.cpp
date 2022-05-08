/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2020-2022 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#include "KDDockWidgets.h"
#include "Platform_qtquick.h"
#include "views/View_qtquick.h"

#include <QApplication> // TODO: Make it QGuiApplication
#include <QQmlEngine>
#include <QQuickStyle>
#include <QQuickItem>
#include <QQuickView>
#include <QtTest/QTest>

using namespace KDDockWidgets;

#ifdef DOCKS_DEVELOPER_MODE

namespace KDDockWidgets {
class TestView_qtquick : public Views::View_qtquick
{
public:
    explicit TestView_qtquick(Platform::CreateViewOptions opts, QQuickItem *parent)
        : Views::View_qtquick(nullptr, Type::None, parent)
        , m_opts(opts)
    {
        setMinimumSize(opts.minSize);
    }

    QSize sizeHint() const override
    {
        return m_opts.sizeHint;
    }

private:
    Platform::CreateViewOptions m_opts;
};
}

Platform_qtquick::Platform_qtquick(int argc, char *argv[])
    : Platform_qt(argc, argv)
{
    new QApplication(argc, argv);
    init();
}

void Platform_qtquick::tests_initPlatform_impl()
{
    Platform_qt::tests_initPlatform_impl();

    QQuickStyle::setStyle(QStringLiteral("Material")); // so we don't load KDE plugins
    plat()->setQmlEngine(new QQmlEngine());
}

void Platform_qtquick::tests_deinitPlatform_impl()
{
    delete m_qmlEngine;
    Platform_qt::tests_deinitPlatform_impl();
}

View *Platform_qtquick::tests_createView(CreateViewOptions opts, View *parent)
{
    auto parentItem = parent ? Views::asQQuickItem(parent) : nullptr;
    auto newItem = new TestView_qtquick(opts, parentItem);

    if (!parentItem) {
        auto view = new QQuickView(m_qmlEngine, nullptr);
        view->resize(QSize(800, 800));

        newItem->QQuickItem::setParentItem(view->contentItem());
        newItem->QQuickItem::setParent(view->contentItem());
        if (opts.isVisible)
            newItem->Views::View_qtquick::setVisible(true);

        QTest::qWait(100); // the root object gets sized delayed
    }

    return newItem;
}

#endif