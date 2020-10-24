package com.termux.app;

import android.graphics.drawable.Drawable;

public interface SuggestionBarButton {
    public String getText();
    public Boolean hasIcon();
    public Drawable getIcon();
    public void click();
}
