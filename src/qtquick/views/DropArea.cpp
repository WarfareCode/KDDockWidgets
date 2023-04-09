/*
  This file is part of KDDockWidgets.

  SPDX-FileCopyrightText: 2019-2023 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
  Author: Sérgio Martins <sergio.martins@kdab.com>

  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only

  Contact KDAB at <info@kdab.com> for commercial licensing options.
*/

#include "DropArea.h"
#include "private/Utils_p.h"
#include "kddockwidgets/core/DropArea.h"

using namespace KDDockWidgets;
using namespace KDDockWidgets::Views;
using namespace KDDockWidgets::qtquick;

DropArea::DropArea(Core::DropArea *dropArea, View *parent)
    : Views::View_qtquick(dropArea, Type::DropArea, asQQuickItem(parent))
    , m_dropArea(dropArea)
{
    Q_ASSERT(dropArea);
    if (isWayland()) {
        qWarning() << "Dropping not implement for QtQuick on Wayland yet!";
    }
}

DropArea::~DropArea()
{
    if (!freed())
        m_dropArea->viewAboutToBeDeleted();
}