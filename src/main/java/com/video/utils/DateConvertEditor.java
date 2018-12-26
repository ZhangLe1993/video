package com.video.utils;

import java.beans.PropertyEditorSupport;

/**
 * 日期转换器。
 * 
 * @author  张宇乐
 *
 */
public class DateConvertEditor extends PropertyEditorSupport {
	public void setAsText(String text) throws IllegalArgumentException {
		setValue(DateUtil.formatStrToDateByLength(text));
	}
}
