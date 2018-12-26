package com.video.utils;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.StringTokenizer;
import java.util.Vector;


/**
 * Created by pandy. Date: 2006-04-12 Desc:
 */
public class DateUtil {

	public static final String DATE_FORMATTER = "yyyy-MM-dd";
	public static final String DATE_YYYYMMDD = "yyyyMMdd";
	public static final String DATE_FORMATTERYM = "yyyyMM";
	public static final String DATE_FORMATTERY = "yyyy";
	public static final String DATE_FORMATTER_HMS = "yyyy-MM-dd HH:mm:ss";
	public static final String DATE_FORMATTER_HM = "yyyy-MM-dd HH:mm";
	public static final String DATE_FORMATTER_H = "yyyy-MM-dd HH";
	public static final String DATE_FORMATTER__H = "yyyy-MM-dd-HH";
	public static final String DATE_FORMATTER__H__M = "yyyy-MM-dd-HH-mm";
	public static final String DATE_FORMATTER_HMS_SSS = "yyyy-MM-dd HH:mm:ss.SSS";

	public static final String DATE_FORMATTER_WEEK = "yyyy-MM-dd E";
	public static final String DATE_FORMATTER_China_HMS = "yyyy年MM月dd日 HH:mm:ss";
	
	public static String oraDateFormat = "TO_DATE(?, 'yyyy-MM-dd')";
	final static public SimpleDateFormat MMddYYYY_HHmmss = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	final static public SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
	final static public SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");
	final static public SimpleDateFormat yyyyMMddHHmm = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	static public SimpleDateFormat yyyyMMddE = new SimpleDateFormat(
			"yyyy年MM月dd日E");
	static public SimpleDateFormat yyyyMMddStr = new SimpleDateFormat(
			"yyyy年MM月dd日");
	static public SimpleDateFormat yyyyMMddEStr = new SimpleDateFormat(
			"yyyy-MM-dd E");


	/**
	 * 得到当前时间的年月
	 * 
	 * @param day
	 */
	public static String getYearMonth(String day) {
		if (day == null)
			return "";
		if (day.length() < 8)
			return "";
		int n = day.lastIndexOf("-");
		return day.substring(0, n);
	}

	/**
	 * 得到当前时间的yyyy年 mm月
	 * 
	 * @param day
	 */
	public static String getYearMonthStr(String day) {
		if (day == null)
			return "";
		if (day.length() < 8)
			return "";
		return day.substring(0, 4) + "年　" + day.substring(5, 7) + "月";
	}

	/**
	 * 得到当前时间的yyyy年 mm月dd日
	 * 
	 * @param day
	 */
	public static String getYearMonthDayStr(String day) {
		if (day == null)
			return "";
		if (day.length() < 8)
			return "";
		return day.substring(0, 4) + "年　" + day.substring(5, 7) + "月"
				+ day.substring(8) + "日";
	}
	
	/**
	 * 得到指定字符串时间的yyyy-mm-dd
	 * 
	 * @param day
	 */
	public static String getYearMonthDayStr2(String day) {
		if (day == null)
			return "";
		if (day.length() < 8)
			return "";
		return day.substring(0, 4) + "-" + day.substring(4, 6) + "-"
				+ day.substring(6,8);
	}

	/**
	 * 返回指定时间的年
	 * 
	 * @param day
	 */
	public static int getYear(String day) {
		if (day == null)
			return 0;
		if (day.length() < 8)
			return 0;
		return Integer.parseInt(day.substring(0, 4));
	}

	/**
	 * 返回指定时间的月
	 * 
	 * @param day
	 */
	public static String getMonth(String day) {
		if (day == null)
			return "0";
		if (day.length() < 8)
			return "0";
		int m = day.indexOf("-", 0);
		int n = day.lastIndexOf("-");
		String temp = day.substring(m + 1, n);
		if (temp.length() == 1)
			temp = "0" + temp;
		return temp;
	}

	/**
	 * 返回指定时间的日
	 * 
	 * @param day
	 */
	public static String getDate(String day) {
		if (day == null)
			return "0";
		if (day.length() < 8)
			return "0";
		int n = day.lastIndexOf("-");
		String temp = day.substring(n + 1);
		if (temp.length() == 1)
			temp = "0" + temp;
		return temp;
	}

	/**
	 * 将时间转化为yyyy-MM-dd HH:mm:ss的字符串时间
	 * 
	 * @param date
	 */
	public static String date2str(java.util.Date date) {
		if (date == null)
			return "";
		try {
			return MMddYYYY_HHmmss.format(date);
		} catch (Exception e) {
			return "";
		}
	}

	/**
	 * 将时间转化为yyyy年MM月dd日E的字符串时间
	 * 
	 * @param date
	 */
	public static String date2YMDE(java.util.Date date) {
		if (date == null)
			return "";
		try {
			return yyyyMMddE.format(date);
		} catch (Exception e) {
			return "";
		}
	}

	
	/**
	 * 将时间转化为yyyy-MM-dd E的字符串时间
	 * 
	 * @param date
	 */
	public static String date2YMDEStr(java.util.Date date) {
		if (date == null)
			return "";
		try {
			return yyyyMMddEStr.format(date);
		} catch (Exception e) {
			return "";
		}
	}

	/**
	 * 将时间转化为yyyy-MM-dd的字符串时间
	 * 
	 * @param date
	 */
	public static String getDateStr(java.util.Date date) {
		if (date == null)
			return "";
		try {
			return yyyyMMdd.format(date);
		} catch (Exception e) {
			return "";
		}
	}

	/**
	 * 将sql时间转化为yyyy-MM-dd的字符串时间
	 * 
	 * @param date
	 */
	static public String date2str(java.sql.Date date) {
		if (date == null)
			return "";
		try {
			return yyyyMMdd.format(date);
		} catch (Exception e) {
			return "";
		}

	}

	/**
	 * 将sql时间转化为yyyy-MM-dd HH:mm:ss的字符串时间
	 * 
	 * @param date
	 */
	static public String dateTime2str(java.sql.Date date) {
		if (date == null)
			return "";
		try {
			return MMddYYYY_HHmmss.format(date);
		} catch (Exception e) {
			return "";
		}
	}

	/**
	 * 将sql时间转化为yyyy-MM-dd HH:mm:ss的字符串时间
	 * 
	 * @param date
	 */
	static public String dateTime2str(java.sql.Timestamp date) {
		if (date == null)
			return "";
		try {
			return MMddYYYY_HHmmss.format(date);
		} catch (Exception e) {
			return "";
		}
	}

	/**
	 * 将日期格式转为yyyy-MM-dd格式的日期
	 * @param date
	 * @return
	 */
	static public java.util.Date dateFormatToDate(java.util.Date date){
		String timeString=yyyyMMdd.format(date);
		return str2date(timeString);
	}
	
	/**
	 * 只得到将时间的年份格式为YYYY
	 * 
	 * @param date
	 */
	static public String getYYYY(java.util.Date date) {
		if (date == null)
			return "";
		return yyyy.format(date);
	}

	/**
	 * 将字符串时间 YYYY-MM-DD 转化为 java.sql.Date object
	 * 
	 * @param str
	 */
	public static Date str2date(String str) {
		java.sql.Date result = null;
		try {
			java.util.Date udate = yyyyMMdd.parse(str);
			result = new Date(udate.getTime());
			return result;
		} catch (Exception e) {
			System.out.println("DateUtil.str2date(str) Error:e = " + e);
			return null;
		}
	}
	
	/**
	 * 将字符串时间 YYYY-MM-DD HH:mm 转化为 java.sql.Date object
	 * 
	 * @param str
	 */
	public static Date str2dateHm(String str) {
		java.sql.Date result = null;
		try {
			java.util.Date udate = yyyyMMddHHmm.parse(str);
			result = new Date(udate.getTime());
			return result;
		} catch (Exception e) {
			System.out.println("DateUtil.str2date(str) Error:e = " + e);
			return null;
		}
	}
	
	/**
	 * 将字符串时间 YYYYMMDDHHmmss 转化为 YYYY-MM-DD HH:mm
	 * 
	 * @param str
	 */
	public static String str2Hm(String timeStr) {
		return timeStr.substring(0, 4)+"-"+timeStr.substring(4, 6)+"-"+timeStr.substring(6, 8)+" "+timeStr.substring(8, 10)+":"+timeStr.substring(10, 12);
	}
	
	/**
	 * 将字符串时间 YYYYMMDD 转化为 YYYY-MM-DD
	 * 
	 * @param str
	 */
	public static String str3Hm(String timeStr) {
		return timeStr.substring(0, 4)+"-"+timeStr.substring(4, 6)+"-"+timeStr.substring(6, 8);
	}
	
	@SuppressWarnings("deprecation")
	public static Timestamp str2dateTime(String handedate) {
		Timestamp time=null;
		try {
            java.util.Date date=str2date(handedate);
			java.util.Date now=new java.util.Date();
			now.setYear(date.getYear());
			now.setMonth(date.getMonth());
			now.setDate(date.getDate());
			time=new Timestamp(now.getTime());
            return time;
        } catch(Exception e) {
        	e.printStackTrace();
            System.out.println("DateUtil.str2dateTime(str) Error:e = " + e);
            return null;
        }
	}
	

	

	/**
	 * 通过当前时间得到下星期的日期，即这星期几得到下星期几是多少号
	 * 
	 * @param curday
	 */
	public static String getNexWeekDayByStr(String curday) {
		try {
			java.util.Date date = str2date(curday);
			/*
			 * Calendar rightNow = Calendar.getInstance();
			 * rightNow.setTime(date); int week =
			 * rightNow.get(Calendar.DAY_OF_WEEK); if (week == 7) week = 6; if
			 * (week == 1) week = 0;
			 */
			return getDateStr(new java.util.Date(date.getTime() + 7 * 24 * 3600
					* 1000));
		} catch (Exception e) {
			System.out.println("DateUtil.getYearWeek(str) Error:e = " + e);
			return "";
		}
	}

	/**
	 * 通过当前时间得到上星期的日期，即这星期几得到上星期几多少号
	 * 
	 * @param curday
	 */
	public static String getPreWeekDayByStr(String curday) {
		try {
			java.util.Date date = str2date(curday);
			/*
			 * Calendar rightNow = Calendar.getInstance();
			 * rightNow.setTime(date); int week =
			 * rightNow.get(Calendar.DAY_OF_WEEK); if (week == 0) week = 1; if
			 * (week == 7) week = 8;
			 */
			return getDateStr(new java.util.Date(date.getTime() - 7 * 24 * 3600
					* 1000));
		} catch (Exception e) {
			System.out.println("DateUtil.getYearWeek(str) Error:e = " + e);
			return "";
		}
	}

	/**
	 * 得到当前日期是本月第几周
	 * 
	 * @param curday
	 */
	public static int getMonthWeek(String curday) {
		try {
			java.util.Date date = str2date(curday);
			Calendar rightNow = Calendar.getInstance();
			rightNow.setTime(date);
			return rightNow.get(Calendar.WEEK_OF_MONTH);
		} catch (Exception e) {
			System.out.println("DateUtil.getYearWeek(str) Error:e = " + e);
			return 0;
		}
	}

	/**
	 * 得到当前日期是本年第几周
	 * 
	 * @param curday
	 */
	public static int getYearWeek(String curday) {
		try {
			java.util.Date date = str2date(curday);
			Calendar rightNow = Calendar.getInstance();
			rightNow.setTime(date);
			return rightNow.get(Calendar.WEEK_OF_YEAR);
		} catch (Exception e) {
			System.out.println("DateUtil.getYearWeek(str) Error:e = " + e);
			return 0;
		}
	}

	/**
	 * 通过当前日期得到上个月的日期
	 * 
	 * @param curday
	 *            df
	 */
	public static String getPreMonthDayStr(String curday) {
		int year = getYear(curday);
		String monthStr = getMonth(curday);
		int month = Integer.parseInt(monthStr);
		if (month <= 1) {
			month = 12;
			year = year - 1;
		} else
			month = month - 1;
		monthStr = String.valueOf(month);
		if (monthStr.length() == 1)
			monthStr = "0" + monthStr;
		return year + "-" + monthStr + "-01";

	}

	/**
	 * 通过当前日期得到下个月的日期
	 * 
	 * @param curday
	 */
	public static String getNextMonthDayStr(String curday) {
		int year = getYear(curday);
		String monthStr = getMonth(curday);
		int month = Integer.parseInt(monthStr);
		if (month >= 12) {
			month = 1;
			year = year + 1;
		} else
			month = month + 1;
		monthStr = String.valueOf(month);
		if (monthStr.length() == 1)
			monthStr = "0" + monthStr;
		return year + "-" + monthStr + "-01";
	}

	/**
	 * 得到当前日期的上一天的日期
	 * 
	 * @param curday
	 */
	public static String getPreDayStr(String curday) {
		java.util.Date date = str2date(curday);
		return date2str(new Date(date.getTime() - 24 * 3600 * 1000));

	}

	/**
	 * 得到当前日期的下一天的日期
	 * 
	 * @param curday
	 */
	public static String getNextDayStr(String curday) {
		java.util.Date date = str2date(curday);
		return date2str(new Date(date.getTime() + 24 * 3600 * 1000));
	}

	/**
	 * 通过字符串日期得到它的年月日期为一号
	 * 
	 * @param curday
	 */
	public static String getCurMonthDayStr(String curday) {
		int year = getYear(curday);
		String monthStr = getMonth(curday);
		int month = Integer.parseInt(monthStr);
		monthStr = String.valueOf(month);
		if (monthStr.length() == 1)
			monthStr = "0" + monthStr;
		return year + "-" + monthStr + "-01";
	}

	/**
	 * 通过字符中日期得到该日期是当前星期中的星期几
	 * 
	 * @param curday
	 */
	public static int getCurWeekDayByStr(String curday) {
		try {
			java.util.Date date = str2date(curday);
			Calendar rightNow = Calendar.getInstance();
			rightNow.setTime(date);
			return rightNow.get(Calendar.DAY_OF_WEEK);
		} catch (Exception e) {
			System.out.println("DateUtil.getYearWeek(str) Error:e = " + e);
			return 1;
		}
	}

	/**
	 * 通过字符串日期得到当前星期的所有日期
	 * 
	 * @param curday
	 */
	public static String[] getallweekdate(String curday) {
		String pandy[] = new String[7];
		int day = getCurWeekDayByStr(curday) - 1;
		String firstday = getAllowPreDay(curday, day);
		for (int i = 0; i < 7; i++) {
			pandy[i] = firstday;
			firstday = getNextDayStr(firstday);
		}
		return pandy;
	}

	/**
	 * 通过字符串日期得到当前星期的所有日期
	 * 
	 * @param curday
	 */
	public static String[] getallweekdateCn(String curday) {
		String pandy[] = new String[7];
		int day = getCurWeekDayByStr(curday) - 1;
		String firstday = getAllowPreDay(curday, day);
		for (int i = 0; i < 7; i++) {
			firstday = getNextDayStr(firstday);
			pandy[i] = firstday;
		}
		return pandy;
	}

	/**
	 * 通过开始日期和结束日期得到其之间的所有星期的第一天和最后一天的日期
	 * 
	 * @param startdate
	 * @param enddate
	 */
	public static String[][] getweekfl(String startdate, String enddate) {
		java.util.Date date1 = str2date(startdate);
		java.util.Date date2 = str2date(enddate);
		long weekcount = (date2.getTime() - date1.getTime())
				/ (24 * 3600 * 1000 * 7) + 1;
		int weekc = (int) weekcount;
		if (getCurWeekDayByStr(startdate) > getCurWeekDayByStr(enddate)) {
			weekc++;
		}
		String pandy[][] = new String[weekc][2];
		String tempdate = startdate;
		for (int i = 0; i < weekc; i++) {
			pandy[i][0] = getallweekdate(tempdate)[0];
			pandy[i][1] = getallweekdate(tempdate)[6];
			tempdate = getNextDayStr(pandy[i][1]);
		}
		return pandy;
	}

	/**
	 * 通过开始日期和结束日期得到之间所有月的第一天和最后一天的日期
	 * 
	 * @param startdate
	 * @param enddate
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Vector getmonthfl(String startdate, String enddate) {
		Vector pandy = new Vector();
		String tempdate = getCurMonthDayStr(startdate);
		while (tempdate.compareTo(enddate) <= 0) {
			String pan[] = new String[2];
			pan[0] = tempdate;
			pan[1] = getPreDayStr(getNextMonthDayStr(tempdate));
			pandy.add(pan);
			tempdate = getNextMonthDayStr(tempdate);
		}
		return pandy;
	}

	/**
	 * 通过开始日期和结束日期得到它们之间的所有日期并用,分开
	 * 
	 * @param startdate
	 * @param enddate
	 */
	public static String getMulday(String startdate, String enddate) {
		String pandy = "";
		String tempdate = startdate;
		while (tempdate.compareTo(enddate) <= 0) {
			pandy += tempdate + ",";
			tempdate = getNextDayStr(tempdate);
		}
		if (pandy.length() > 0)
			pandy = pandy.substring(0, pandy.length() - 1);
		return pandy;
	}

	/**
	 * 通过开始日期和结束日期得到这们之间所有星期的第一天和最后一天并用,分开
	 * 
	 * @param startdate
	 * @param enddate
	 */
	public static String getMulweekday(String startdate, String enddate) {
		String pandy = "";
		String tempdate[][] = getweekfl(startdate, enddate);
		for (int i = 0; i < tempdate.length; i++) {
			pandy += tempdate[i][0] + "--" + tempdate[i][1] + ",";
		}
		if (pandy.length() > 0)
			pandy = pandy.substring(0, pandy.length() - 1);
		return pandy;
	}

	/**
	 * 通过开始日期和结束日期得到它们之间所有月的第一天和最后一天日期用,分开
	 * 
	 * @param startdate
	 * @param enddate
	 */
	@SuppressWarnings({ "rawtypes" })
	public static String getMulmonthday(String startdate, String enddate) {
		String pandy = "";
		Vector tempdate = getmonthfl(startdate, enddate);
		String temp[] = new String[2];
		for (int i = 0; i < tempdate.size(); i++) {
			temp = (String[]) tempdate.get(i);
			pandy += temp[0] + "--" + temp[1] + ",";

		}
		if (pandy.length() > 0)
			pandy = pandy.substring(0, pandy.length() - 1);
		return pandy;
	}

	/**
	 * 通过开始时间得到count后的日期
	 * 
	 * @param startdate
	 * @param count
	 */
	public static String getAllowDay(String startdate, int count) {
		String pandy = startdate;
		for (int i = 0; i < count; i++) {
			pandy = getNextDayStr(pandy);
		}
		return pandy;
	}

	/**
	 * 通过开始时间得到count前的日期
	 * 
	 * @param startdate
	 * @param count
	 */
	public static String getAllowPreDay(String startdate, int count) {
		String pandy = startdate;
		for (int i = 0; i < count; i++) {
			pandy = getPreDayStr(pandy);
		}
		return pandy;
	}

	/**
	 * 通过开始时间得到count星期后的日期
	 * 
	 * @param startdate
	 * @param count
	 */
	public static String getAllowWeek(String startdate, int count) {
		return getAllowDay(startdate, count * 7);
	}

	/**
	 * 通过开始时间得到count星期前的日期
	 * 
	 * @param startdate
	 * @param count
	 */
	public static String getAllowPreWeek(String startdate, int count) {
		return getAllowPreDay(startdate, count * 7);
	}

	/**
	 * 通过开始时间得到count月后的日期
	 * 
	 * @param startdate
	 * @param count
	 */
	public static String getAllowMonth(String startdate, int count) {
		String tempdate = getCurMonthDayStr(startdate);
		for (int i = 0; i < count; i++) {
			tempdate = getNextMonthDayStr(tempdate);
		}
		return tempdate;
	}

	/**
	 * 通过开始时间得到count月前的日期
	 * 
	 * @param startdate
	 * @param count
	 */
	public static String getAllowPreMonth(String startdate, int count) {
		String tempdate = getCurMonthDayStr(startdate);
		for (int i = 0; i < count; i++) {
			tempdate = getPreMonthDayStr(tempdate);
		}
		return tempdate;
	}

	/**
	 * 得到一个月有多少天
	 */
	public static int getMonthDaysCounts(String curday) {
		long daycount = 0;
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(str2date(getCurMonthDayStr(curday)));
			Calendar calendar2 = Calendar.getInstance();
			calendar2.setTime(str2date(getNextMonthDayStr(curday)));
			daycount = (calendar2.getTimeInMillis() - calendar
					.getTimeInMillis())
					/ (1000 * 60 * 60 * 24);
			return (int) daycount;
		} catch (Exception e) {
			e.printStackTrace(); // To change body of catch statement use File |
									// Settings | File Templates.
			return 0;
		}
	}

	/**
	 * 得到一个月所有的日期
	 */
	public static String[] getMonthDays(String curday) {
		int counts = getMonthDaysCounts(curday);
		String pandy[] = new String[counts];
		String day = getCurMonthDayStr(curday);
		pandy[0] = getCurMonthDayStr(curday);
		for (int i = 1; i < counts; i++) {
			day = getNextDayStr(day);
			pandy[i] = day;
		}
		return pandy;
	}

	/**
	 * 得到一个日期格式为YYYY年MM月DD日－MM月DD日
	 * 
	 * @param start
	 * @param end
	 */
	public static String getymdmd(String start, String end) {
		String ymd = "";
		StringTokenizer fenxi = new StringTokenizer(start, "-");
		StringTokenizer fenxi2 = new StringTokenizer(end, "-");
		ymd += fenxi.nextToken() + "年  ";
		ymd += fenxi.nextToken() + "月 ";
		ymd += fenxi.nextToken() + "日 - ";
		fenxi2.nextToken();
		ymd += fenxi2.nextToken() + "月 ";
		ymd += fenxi2.nextToken() + "日";
		return ymd;
	}

	/**
	 * 通过当前月，得到当前的日期yyyy-mm-01
	 */
	public static String getFirstCurdata(String curmongth) {
		String pandy = "";
		String cur = getDateStr(new java.util.Date());
		if (curmongth.length() == 1)
			curmongth = "0" + curmongth;
		pandy = getYear(cur) + "-" + curmongth + "-01";
		return pandy;
	}

	/**
	 * 通过当前月，得到当前的日期yyyy-mm-01
	 */
	public static String getLastCurdata(String curmongth) {
		String pandy = "";
		String cur = getDateStr(new java.util.Date());
		if (curmongth.length() == 1)
			curmongth = "0" + curmongth;
		pandy = getYear(cur) + "-" + curmongth + "-" + getMonthDaysCounts(cur);
		return pandy;
	}

	public static void main(String[] args) {
		System.out.println(getFirstCurdata(getMonth("2017-05-10")));
		System.out.println(getLastCurdata(getMonth("2017-05-10")));
	}
	
	/**
	 * 获得当前时间
	 * 
	 * @param parrten
	 *            输出的时间格式
	 * @return 返回时间
	 */
	public static String getTime(String parrten) {
		String timestr;
		if (parrten == null || parrten.equals("")) {
			parrten = "yyyyMMddHHmmss";
		}
		java.text.SimpleDateFormat sdf = new SimpleDateFormat(parrten);
		java.util.Date cday = new java.util.Date();
		timestr = sdf.format(cday);
		return timestr;
	}
	
	/**
	 * <p>根据字符串长度来转换日期。失败返回null.</p>  
	 * @param: @param dateStr 日期字符串
	 * @param: @return   日期   
	 * @return: Date      
	 * @throws
	 */
	public static java.util.Date formatStrToDateByLength(String dateStr) {
		if (dateStr==null||dateStr.isEmpty()) {
			return null;
		}
		int strLength = dateStr.length();
		java.util.Date date = new java.util.Date();
		String dateFormat = DATE_FORMATTER;
		SimpleDateFormat sdf = null;
		try {
			if(strLength==DATE_FORMATTER_HMS_SSS.length()){
				dateFormat = DATE_FORMATTER_HMS_SSS;
			}if(strLength==DATE_FORMATTER_HM.length()){
				dateFormat = DATE_FORMATTER_HM;
			}if(strLength==DATE_FORMATTER_HMS.length()){
				dateFormat = DATE_FORMATTER_HMS;
			}
			sdf = new SimpleDateFormat(dateFormat);
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
		return date;
	}
	/**
     * 通过时间秒毫秒数判断两个时间的间隔
     * @param date1
     * @param date2
     * @return
     */
    public static int differentDaysByMillisecond(java.util.Date date1,java.util.Date date2){
        int days = (int) ((date2.getTime() - date1.getTime()) / (1000*3600*24));
        return days;
    }

    
    /**
     * 得到系统当前时间 yyyy-MM-dd HH:mm
     * @return
     */
    public static String formatDate() {
    	java.util.Date date = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sdf.format(date);
    }
	 
}
