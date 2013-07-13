package net.kongyunblog.tools;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * @author huangcongmin
 * @date 2013-3-10 下午3:51:01
 */
public class FileHelper {

	/**
	 * 将上传的文件进行重命名,
	 * 例如：abc.jpg  -> 20121005******.jpg
	 * @author huangcongmin
	 * @date 2013-3-10 下午3:51:44
	 * @param name
	 * @return
	 */
	public static String rename(String name) {
		Long now = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		Long random = (long) (Math.random() * now);
		String fileName = now + "" + random;
		if (name.indexOf(".") != -1) {
			fileName += name.substring(name.lastIndexOf("."));
		}
		return fileName;
	}

	/**
	 * 压缩后的文件名,
	 * zipName例如：  abc.jpg   ->    abc.zip
	 * @author huangcongmin
	 * @date 2013-3-10 下午3:52:20
	 * @param name
	 * @return
	 */
	public static String zipName(String name) {
		String prefix = "";
		if (name.indexOf(".") != -1) {
			prefix = name.substring(0, name.lastIndexOf("."));
		} else {
			prefix = name;
		}
		return prefix + ".zip";
	}

}