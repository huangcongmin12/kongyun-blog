package net.kongyunblog.tools;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 邮箱格式判断工具类
 * @author huangcongmin
 * @date 2013-3-15
 */
public class EmailHelper {
	
	/**
	 * 判断邮箱格式
	 * @author huangcongmin
	 * @date 2013-3-15
	 * @param email
	 * @return
	 */
	public static boolean emailFormat(String email)
    {
        boolean tag = true;
        final String pattern1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        final Pattern pattern = Pattern.compile(pattern1);
        final Matcher mat = pattern.matcher(email);
        if (!mat.find()) {
            tag = false;
        }
        return tag;
    }
}
