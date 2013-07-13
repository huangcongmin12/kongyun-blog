package net.kongyunblog.tools;

import java.text.SimpleDateFormat;
import java.util.Date;



/**
 *
 * @author Administrator
 * 2013-3-10 下午3:36:30 
 */
public class DateHelper {
	
	/**
	 * 格式化时间
	 * @param date
	 * @return
	 */
	public static String getTime(Date date) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(date);
	}
	
	/**
	 * 
	 * @author huangcongmin
	 * @date 2013-3-17
	 * @param date
	 * @return
	 */
	public static String getYearAndMonth(Date date) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
		return df.format(date);
	}
	
	/**
	 * 
	 * @author huangcongmin
	 * @date 2013-3-17
	 * @param date
	 * @return
	 */
	public static String getYear_Month(Date date) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月");
		return df.format(date);
	}
	
}
