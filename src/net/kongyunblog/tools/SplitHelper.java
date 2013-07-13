package net.kongyunblog.tools;

/**
 * 字符串按指定长度进行分割
 * 
 * @author huangcongmin
 * @date 2013-3-17
 */
public class SplitHelper {

	/**
	 * 以下方法设和GBK字符串，如果是其他编码的字符串，要修改一下
	 * @author huangcongmin
	 * @date 2013-3-17
	 * @param msg
	 * @param num
	 * @return
	 */
	public static String subString(String str, int bytelength) {
	        if (str == null) {
	            return null;
	        }
	        if (bytelength <= 0) {
	            return "";
	        }
	        try {
	            if (str.getBytes("GBK").length <= bytelength) {
	                return str;
	            }
	        } catch (Exception ex) {
	        }
	        StringBuffer buff = new StringBuffer();

	        int index = 0;
	        char c;
	        while (bytelength > 0) {
	            c = str.charAt(index);
	            if (c < 128) {
	                bytelength--;
	            } else {//GBK编码汉字占2字节，其他编码的不一样，要修改下面几句
	                bytelength--;
	                if (bytelength < 1)//被截断了
	                    break;
	                bytelength--;
	            }
	            buff.append(c);
	            index++;
	        }
	        buff.append("...");
	        return buff.toString();
	    }
	
}
